class ProductsController < ApplicationController
  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
        flash[:success] = "已成功新增商品"
      	redirect_to new_product_path
    else
        flash[:error] = ""
    end
  end

private
  def product_params
  	params.require(:product).permit(:category_id, :name, :description, :price, :image)
  end
	
end
