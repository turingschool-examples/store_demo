class OrderedProduct
  def self.for(user)
    products = Order.by(user).map do |order|
      order.products
    end.flatten.uniq
    ratings = Rating.where(user_id: user.id).
      inject({}) do |memo, rating|
      memo[rating.product_id] = rating
      memo
    end
    products.map do |product|
      OrderedProduct.new(product, ratings[product.id])
    end
  end

  extend Forwardable

  def initialize(product, rating)
    @product = product
    @rating = rating
  end

  def rated?
    !!rating
  end

  def_delegator :rating, :id, :rating_id
  def_delegator :rating, :created_at, :rated_at
  def_delegator :rating, :editable?, :rating_editable?
  def_delegators :product, :title, :id
  def_delegators :rating, :stars

  private
  attr_reader :product, :rating
end
