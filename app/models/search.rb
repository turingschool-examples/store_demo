module Search
  def self.filter_products(params = {})
    scope = if params[:category_id].present?
      Category.find(params[:category_id]).products
    elsif params[:search].present?
      Product.for_term(params[:search])
    else
      Product.scoped
    end
    scope.active.paginate(:page => (params[:page] || 1), :per_page => 24)
  end

  def self.filter_user_orders(user_id, params={})
    orders = Order.where(user_id: user_id).all
    if params[:search].present?
      products = Product.for_term(params[:search])
      orders.select { |order| (order.products & products).present? }
    else
      orders
    end
  end

  def self.filter_admin_orders(params={})
    orders = Order.includes(:user)
                  .by_status(params[:status])
                  .by_email(params[:email])
    orders = filter_date(orders, params)
    orders = orders.by_recency.paginate(:page => (params[:page] || 1), :per_page => 24)
  end

  def self.filter_date(order, params)
    if params[:date_symbol].present? && params[:date].present?
      date = params[:date].split('-').map{ |char| char.to_i }
      if params[:date_symbol] == '<' || params[:date_symbol] == '>'
        order.where("orders.created_at #{params[:date_symbol]}= ?",
                            params[:date])
      elsif params[:date_symbol] == '='
        order.where("orders.created_at >= ? and orders.created_at <= ?",
          DateTime.new(date[0], date[1], date[2]),
          DateTime.new(date[0]+1, date[1], date[2]))
      end
    else
      order
    end
  end
end
