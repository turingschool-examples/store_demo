class Payment
  attr_reader :token, :price, :email, :order

  def self.new_with_charge(params)
    payment = new(params)
    payment.charge
  end

  def initialize(params)
    @token = params[:token]
    @price = (params[:price] * 100).to_i
    @email = params[:email]
    @order = params[:order]
  end

  def charge
    begin
      charge = charge_stripe
      order.status = 'paid'
      order.save
      charge
    rescue
    end
  end

  def charge_stripe
    if StoreConfig.charging?
      Stripe::Charge.create(:amount => price,
                            :currency => "usd",
                            :card => token,
                            :description => email)
    end
  end
end
