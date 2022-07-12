class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  def index
    @companies = Company.all
  end

  def show
    @employees = @company.employees
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
      if @company.save
        flash[:notice] = "Company was successfully created."
        redirect_to company_url(@company)
      else
        flash.now[:alert] = "Something went wrong, Please try again."
        render :new
      end
  end


  def update
      if @company.update(company_params)
        flash[:notice] = "Company was successfully updated."
        redirect_to company_url(@company)
      else
        flash.now[:alert] = "Something went wrong, Please try again."
        render :edit
      end
  end

  def destroy
    @company.destroy
      flash[:notice] = "Company was successfully destroyed."
      redirect_to companies_url
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:company_name, :company_address, :email, :mobile)
    end
end
