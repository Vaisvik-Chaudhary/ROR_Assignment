class EmployeesController < ApplicationController
  before_action :get_company
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees or /employees.json
  def index
    @employees = @company.employees
  end

  # GET /employees/1 or /employees/1.json
  def show
  #   @company = Company.find(params[:company_id])
  #   @employee = Employee.find(params[:id])
  # @company = @employee.company
  end

  # GET /employees/new
  def new
    @employee = @company.employees.build
    # @employee = Employee.new(company_id: params[:company_id])
    # @company=Company.find_by(id: params[:id])
    # p @company
    # @company = Company.employees.find(params[:employee])
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    @employee = @company.employees.build(employee_params)
   

    respond_to do |format|
      if @employee.save
        format.html { redirect_to company_path(@company), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to company_employee_path(@company), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to company_path(@company), notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_company
      @company = Company.find(params[:company_id])
    end
    def set_employee
      @employee = @company.employees.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :mobile_number, :address, :email, :company_id)
    end
end
