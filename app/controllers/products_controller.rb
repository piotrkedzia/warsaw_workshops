class ProductsController < ApplicationController
  before_action :authenticate_user!
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
    self.products = category.products
  end

  def show
  end

  def new
  end

  def edit
    if product.user != current_user

      flash[:error] = 'You are not allowed to edit this product.'
      redirect_to category_product_url(category,product)
      #Why this doesn't work?
      #redirect_to(category_product_url(category, product), error: "You are not allowed to edit this product.")
    end
  end

  def create
    self.product = Product.new(product_params)
    self.product.user = current_user
    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.user != current_user

      flash[:error] = 'You are not allowed to edit this product.'
      redirect_to category_product_url(category, product)
      #Why this doesn't work?
      #redirect_to(category_product_url(category, product), error: "You are not allowed to edit this product.")
    else
      if self.product.update(product_params)
        redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
      else
        # render action: 'edit' ??? is this ok
        redirect_to category_product_url(category, product), notice: 'There was some errors'
      end
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
