# class CategoriesController < ApplicationController

#   def show
#     @category = Category.find(params[:id])
#     @products = @category.products.order(created_at: :desc)
#   end
# end

class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  def index
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create 
    @category = Category.new(params.require(:category).permit(:name))

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end
end