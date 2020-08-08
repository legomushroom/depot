class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart, except: [:edit, :delete, :update, :show]

  def index
    @products = Product.order(:title)

    if session[:visits] == nil
      session[:visits] = 1
    else
      session[:visits] += 1
    end
  end
end

