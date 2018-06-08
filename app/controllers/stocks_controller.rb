class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "YOU HAVE ENTER A EMPTY STRING"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "YOU HAVE ENTER A WRONG SYMBOL" unless @stock      
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end