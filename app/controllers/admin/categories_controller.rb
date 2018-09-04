class Admin::CategoriesController < ApplicationController

  before_action :require_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
    redirect_to admin_categories_path
  end

  private

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
