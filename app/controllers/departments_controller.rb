class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
        # url = /departments  (GET)
    @departments = Department.all
  end

  def show
        # url = /departments/:id  (GET)
  end

  def new
        # url = /departments/new  (GET)
    @department = Department.new
    # render partial: "form"
  end

  def create
        # url - /departments  (POST)
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit

  @department = Department.find(params[:id])
    #  render partial: "form"
  end

  def update
        # url - /departments/:id  (PUT)
    if @department.update(department_params)
      redirect_to department_path(@department)
    else
      render :edit
    end
  end

  def destroy
        # url - "/departments/:id"  (DELETE)
    @department.destroy    
    redirect_to departments_path
  end

  private
  
    def department_params
      params.require(:department).permit(:name)
    end

  def set_department
    @department = Department.find(params[:id])
  end

end
