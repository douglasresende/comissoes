class ProductsController < ApplicationController
  before_filter :require_authentication

  def index
    @products = current_user.products
  end

  def show
    @product = current_user.products.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @product = current_user.products.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    redirect_to products_url
  end
end
