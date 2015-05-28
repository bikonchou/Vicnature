class Admin::CategoryProductsController < ApplicationController
	before_action :authenticate_user
	before_action :find_admin_category

	def index
		@products = @admin_category.products
	end

	def show
		@product = @admin_category.products.find(params[:id])
	end

	def new
		@product = @admin_category.products.build
	end

	def create
		@product = @admin_category.products.build(product_params)
		if @product.save
		    flash[:success] = "已成功新增商品"	
		    redirect_to admin_category_products_path
		else
			flash[:error] = ""
			render :action => :new
		end
	end

	def edit
		@product = @admin_category.products.find(params[:id])
	end

	def update
		@product = @admin_category.products.find(params[:id])
		if @product.update(product_params)
			flash[:success] = "已成功修改商品"			
			redirect_to admin_category_products_path(@admin_category)
		else
			flash[:error] = ""
			render :action => :edit
		end
	end

	def destroy
		@product = @admin_category.products.find(params[:id])
		if @product.destroy
			flash[:success] = "已成功刪除商品"
			redirect_to admin_category_products_path
		else
			flash[:error] = ""
			redirect_to :back
		end
	end

protected
	def find_admin_category
		@admin_category = Category.find(params[:category_id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :price, :image)
	end	

end
