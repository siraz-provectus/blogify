class CategoriesController < ApplicationController

  expose :categories
  expose :category, attributes: :category_params
  expose(:subcategories) {
    category.children
  }

  def index
  end


  def load_subcategories
  end

  private

  def category_params
    params.require(:category).permit(:title, :ancestry)
  end
end