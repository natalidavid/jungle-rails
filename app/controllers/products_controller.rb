class ProductsController < ApplicationController

  def index
    #model
    @products = Product.all.order(created_at: :desc)
    #view
    #render: index --this is implicit
  end

  def show
    @product = Product.find params[:id]
  end
end


