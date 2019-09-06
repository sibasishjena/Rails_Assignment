class EmployeesController < ApplicationController
    def index
        @employees=Employee.all
    end

    def show
        #render plain: params[:id].inspect
        @employee = Employee.find(params[:id])
    end

    def new
        @employee=Employee.new
    end

    def edit
        @employee = Employee.find(params[:id])
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
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to employees_path
        else
            render 'edit'
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end

    
    private
        def employee_params
            params.require(:employee).permit(:name,:age,:designation)
        end
end
