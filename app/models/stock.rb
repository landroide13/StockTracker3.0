class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    begin
      look_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(ticker: look_up_stock.symbol, name: look_up_stock.company_name , last_price: look_up_stock.close)
    rescue => exception
      return nil
    end
  end


end
