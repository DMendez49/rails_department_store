class itemsController < ApplicationController
  before_action :set_departments
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
        # url - /departmentss/:departments_id/items  (GET)    
    @items = @departments.items
  end

  def show
        # url - /departmentss/:departments_id/items/:id  (GET)    
  end

  def new
        # url - /departmentss/:departments_id/items/new  (GET)
    @item = @departments.items.new
    render partial: "form"
  end

  def create
        # url - /departmentss/:departments_id/items  (POST)
    @item = @departments.items.new(item_params)

    if @item.save
      redirect_to departments_items_path(@departments)
    else
      render :new
    end
  end

  def edit
        # url - /departmentss/:departments_id/items/:id/edit  (GET)
    render partial: "form"
  end

  def update
        # url - /departmentss/:departments_id/items/:id  (PUT)    
    if @item.update(item_params)
      redirect_to departments_item_path(@departments, @item)
    else
      render :edit
    end
  end

  def destroy
        # url - /departmentss/:departments_id/items/:id  (DELETE) 
    @item.destroy
    redirect_to departments_items_path(@departments)
  end

  private
    def set_departments
      @departments = departments.find(params[:departments_id])
    end

    def set_item
      @item = item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :body)
    end
end
