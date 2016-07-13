class StoreController < ApplicationController
  def index
    @products = Product.order(:title).page params[:page]
  end
end
