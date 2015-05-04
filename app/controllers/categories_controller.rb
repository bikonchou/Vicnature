class CategoriesController < ApplicationController
  def index
  	@category = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)	
  	@category.save

  	redirect_to categories_path
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])	
  	@category.update(update_category_params)

  	redirect_to categories_path
  end

  def destroy
  	@category = Category.find(params[:id])
  	@category.destroy

  	redirect_to categories_path
  end

  private
  def category_params
  	params.require(:category).permit(:title, :description)
  end

  def update_category_params
  	params.require(:category).permit(:id, :title, :description)
  end

end
