class CategoriesController < ApplicationController

  expose :categories
  expose :category, attributes: :category_params
  expose(:subcategories) {
    category.children
  }

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  def load_subcategories
  end

  private

  def category_params
    params.require(:category).permit(:title, :ancestry)
  end
end