require 'spec_helper'

describe Admin::OrdersController do
  it "index action should render index template" do
    controller.stub(:require_admin => true)
    get :index
    response.should render_template(:index)
  end

  it "index action should return a collection of orders" do
    controller.stub(:require_admin => true)
    user = FactoryGirl.create(:user)
    orders = [FactoryGirl.create(:order, user: user)]

    get :index
    expect(assigns(:orders)).to match_array orders
  end

  it "show action should return an individual order" do
    controller.stub(:require_admin => true)
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    get :show, id: order.id
    expect(assigns(:order)).to eq order
  end

  describe 'update' do
    it 'works correctly' do
      controller.stub(:require_admin => true)
      user = FactoryGirl.create(:user)
      order = FactoryGirl.create(:order, user_id: user.id)
      request.env["HTTP_REFERER"] = '/'
      post :update, id: order.id, update_status: 'pending'
      expect(order.status).to eq 'pending'
    end
  end
end
