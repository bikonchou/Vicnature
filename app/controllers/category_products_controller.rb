class CategoryProductsController < ApplicationController
	before_action :sidebar_categories
	before_action :find_category
	layout "categories"

	def index
		@products = @category.products.page(params[:page]).per(9)
	end

	def show
		@product = @category.products.find(params[:id])
	end

protected
	def find_category
		@category = Category.find(params[:category_id])
	end

end
