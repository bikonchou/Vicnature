class CategoriesController < ApplicationController
  def index
  	@category = Category.all
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)	
  	if @category.save  
      flash[:success] = "成功新增商品類別"
      redirect_to categories_path
    else
      flash[:error] = ""  
  	  render :action => :new
    end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])	
  	if @category.update(update_category_params)
       flash[:success] = "成功修改商品類別"
  	   redirect_to categories_path
    else
       flash[:error] = ""
       render :action => :edit
     end
  end

  def destroy
  	@category = Category.find(params[:id])
  	if @category.destroy
       flash[:success] = "已成功刪除商品類別"
    else
       flash[:error] = ""
    end
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
