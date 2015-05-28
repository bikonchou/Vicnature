class CategoryProductsController < ApplicationController
	before_action :find_category
	layout "categories"
	def index
		@products = @category.products
	end


protected
	def find_category
		@category = Category.find(params[:category_id])
	end

end
