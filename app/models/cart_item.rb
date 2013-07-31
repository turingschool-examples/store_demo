class CartItem
  attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def title
    product.title
  end

  def unit_price
    product.price
  end

  def selling_price
    product.current_price.round(2)
  end

  def percent_off
    product.percent_off
  end

  def on_sale?
    product.on_sale?
  end

  def total
    BigDecimal.new(quantity.to_s) * BigDecimal.new(selling_price.to_s)
  end
end
