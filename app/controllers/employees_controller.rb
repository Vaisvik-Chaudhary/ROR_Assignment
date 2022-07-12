class EmployeesController < ApplicationController
  before_action :get_company
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @employees = @company.employees
  end

  def show
  end

  def new
    @employee = @company.employees.build
  end

  def edit
  end

  def create
    @employee = @company.employees.build(employee_params)
      if @employee.save
        flash[:notice] = "Employee was successfully created."
        redirect_to company_path(@company)
      else
        flash.now[:alert] = "Something went wrong, Please try again."
        render :new
      end
  end

  def update
      if @employee.update(employee_params)
        flash[:notice] = "Employee was successfully updated."
        redirect_to company_employee_path(@company)
      else
        flash.now[:alert] = "Something went wrong, Please try again."
        render :edit
      end
  end

  def destroy
    @employee.destroy
      flash[:notice] = "Employee was successfully destroyed."
      redirect_to company_path(@company)
  end

  private
    def get_company
      @company = Company.find(params[:company_id])
    end
    def set_employee
      @employee = @company.employees.find(params[:id])
    end
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :mobile_number, :address, :email, :company_id)
    end
end
