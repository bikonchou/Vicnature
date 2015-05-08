class CategoryProductsController < ApplicationController
	before_action :find_category

	def index
		@products = @category.products
	end

	def new
		@product = @category.products.build
	end

	def create
		@product = @category.products.build(product_params)
		if @product.save
		    flash[:success] = "已成功新增商品"	
		    redirect_to category_products_path
		else
			flash[:error] = ""
			render :action => :new
		end
	end

	def edit
		@product = @category.products.find(params[:id])
	end

	def update
		@product = @category.products.find(params[:id])
		if @product.update(product_params)
			flash[:success] = "已成功修改商品"			
			redirect_to category_products_path(@category)
		else
			flash[:error] = ""
			render :action => :edit
		end
	end

	def destroy
		@product = @category.products.find(params[:id])
		if @product.destroy
			flash[:success] = "已成功刪除商品"
			redirect_to category_products_path
		else
			flash[:error] = ""
			redirect_to :back
		end
	end


protected
	def find_category
		@category = Category.find(params[:category_id])
	end

	def product_params
		params.require(:product).permit(:name, :description, :price, :image)
	end
end
