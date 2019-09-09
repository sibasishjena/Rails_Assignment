class EmployeesController < ApplicationController
    def employee_params
        params.require(:employee).permit(:name,:age,:designation,:company)
    end
    
    def index
        @employees=Employee.all
        binding.pry
    end

    def show
        #render plain: params[:id].inspect
        @employee = find_employee
    end

    def new
        @employee=Employee.new
    end

    def edit
        @employee = find_employee
    end

    def create
        #render plain: params[:employee].inspect
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employees_path
        else
            render 'new'
        end
    end

    def update
        @employee = find_employee
        if @employee.update(employee_params)
            redirect_to employees_path
        else
            render 'edit'
        end
    end

    def destroy
        @employee = find_employee
        @employee.destroy
        redirect_to employees_path
    end
    
    def find_employee
        Employee.find(params[:id])
    end
    skip_before_action find_employee, only: [:new, :create, :index]
end
