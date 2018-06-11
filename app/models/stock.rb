class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker)
    where(ticker: ticker).first
  end

  def self.new_from_lookup(ticker_symbol)
    begin
      look_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(ticker: look_up_stock.symbol, name: look_up_stock.company_name , last_price: look_up_stock.close)
    rescue => exception
      return nil
    end
  end


end
