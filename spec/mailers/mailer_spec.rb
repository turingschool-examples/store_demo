require 'spec_helper'

describe Mailer do
  it 'sends a welcome email' do
    user = FactoryGirl.create(:user)
    email = Mailer.welcome_email(user).deliver
    expect(ActionMailer::Base.deliveries).to_not be_empty
  end

  it 'sends an order confirmation email' do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    email = Mailer.order_confirmation(user, order).deliver
    expect(ActionMailer::Base.deliveries).to_not be_empty
  end
end
