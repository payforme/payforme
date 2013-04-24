module ApplicationHelper
  def nice_price(price)
    value = price.centAmount.to_f / 100
    sprintf("%5.2f #{price.currencyCode}", value)
  end
end
