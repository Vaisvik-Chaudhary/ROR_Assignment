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
    respond_to do |format|
      if @employee.save
        format.html { redirect_to company_path(@company), notice: "Employee was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to company_employee_path(@company), notice: "Employee was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to company_path(@company), notice: "Employee was successfully destroyed." }
    end
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
