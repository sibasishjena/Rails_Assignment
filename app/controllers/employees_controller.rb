class EmployeesController < ApplicationController
    before_action :find_employee, except: [:new, :create, :index]
    
    def index
        #binding.pry
        @employees=Employee.all
    end

    def show
        #render plain: params[:id].inspect
        #@employee = find_employee
    end

    def new
        @employee=Employee.new
    end

    def edit
        #@employee = find_employee
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
        #@employee = find_employee
        if @employee.update(employee_params)
            redirect_to employees_path
        else
            render 'edit'
        end
    end

    def destroy
        #@employee = find_employee
        @employee.destroy
        redirect_to employees_path
    end

    private
    def employee_params
        params.require(:employee).permit(:name,:age,:designation,:company)
    end

    def find_employee
        @employee=Employee.find(params[:id])
        #binding.pry
    end
end
