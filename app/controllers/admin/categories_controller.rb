class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user

  def index
  	@admin_category = Admin::Category.all.order(:id)
  end

  def new
  	@admin_category = Admin::Category.new
  end

  def create
  	@admin_category = Admin::Category.new(category_params)
	  if @admin_category.save  
    	flash[:success] = "成功新增商品類別"
    	redirect_to admin_categories_path
    else
     	flash[:error] = @admin_category.errors.full_messages
  		render :action => :new
    end
  end

  def edit
  	@admin_category = Admin::Category.find(params[:id])
  end

  def update
  	@admin_category = Admin::Category.find(params[:id])
  	if @admin_category.update(update_category_params)
      flash[:success] = "成功修改商品類別名稱"
      redirect_to admin_categories_path
    else
	    flash[:error] = @admin_category.errors.full_messages
      render :action => :edit
    end
  end

  def destroy
  	@admin_category = Admin::Category.find(params[:id])
  	if @admin_category.destroy
      flash[:success] = "已成功刪除商品類別"
    else
      flash[:error] = @admin_category.errors.full_messages
    end
    redirect_to admin_categories_path
  end

protected
  def category_params
  	params.require(:admin_category).permit(:title, :description)
  end

  def update_category_params
  	params.require(:admin_category).permit(:id, :title, :description)
  end
end
