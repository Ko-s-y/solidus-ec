class Potepan::ProductsController < ApplicationController
  DISPLAYED_PRODUCTS_LIMIT = 4
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = @product.related_products.includes(master: [:images, :default_price]).limit(DISPLAYED_PRODUCTS_LIMIT)
  end
end
