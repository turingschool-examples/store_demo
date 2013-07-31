require 'spec_helper'

describe Payment do
  context '.charge' do
    it 'changes order status to paid' do
      user = FactoryGirl.create(:user)
      order = FactoryGirl.create(:order, user: user)
      payment = Payment.new(order: order, price: 2)
      payment.stub(:charge_stripe) { true }
      payment.charge
      expect(order.status).to eq 'paid'
    end
  end
end
