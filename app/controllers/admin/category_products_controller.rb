class Admin::CategoryProductsController < ApplicationController
before_action :find_admin_category_products

def index
	@products = @admin_category.products
end

protected
	def find_admin_category_products
		@admin_category = Admin::Category.find(params[:category_id])
	end

	# def product_params
	# 	params.require(:product).permit(:name, :description, :price, :image)
	# end
end

