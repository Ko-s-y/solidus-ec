class Potepan::ProductsController < ApplicationController
  def show
    @product = Spree::Product.find(params[:id])
    @related_products = Spree::Product.all.includes(master: [:images, :default_price]).limit(4)
  end
end
