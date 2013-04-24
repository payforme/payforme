module ApplicationHelper
  def nice_price(price)
    value = price.centAmount.to_f / 100
    sprintf("%5.2f #{price.currencyCode}", value)
  end

  def nicer_price(price)
    value = price.to_f / 100
    sprintf("%5.2f", value)
  end
end
