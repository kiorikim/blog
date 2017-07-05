class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was added"
      redirect_to categories_path
    else
      render "new"
    end
  end

  def show
    @category = Category.find(params[:id])
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category was updated"
      redirect_to categories_path
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @article.destroy
    flash[:danger] = "Category was deleted"
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
