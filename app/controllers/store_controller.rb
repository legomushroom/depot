class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart, except: [:edit, :delete, :update, :show]
  skip_before_action :authorize

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product
        .where('locale=?', I18n.locale)
        .order(:title)
    end

    if session[:visits] == nil
      session[:visits] = 1
    else
      session[:visits] += 1
    end
  end
end

