require 'spec_helper'

describe "admin dashboard" do
  before(:each) do
    FactoryGirl.create(:admin)
    visit login_path
    fill_in 'sessions_email', with: 'allison@example.com'
    fill_in 'sessions_password', with: 'password'
    click_button 'Login'

    @product = FactoryGirl.create(:product, title: 'Princess')
    @category = FactoryGirl.create(:category, title: 'Brutes')
    visit admin_sales_path
  end

  it 'can create a sale with the correct params' do
    click_button 'Create Sale'
    select 'Princess', from: 'foreign_key'
    fill_in 'percent_off', with: '10'
    click_button 'Submit'
    expect(current_path).to eq admin_sales_path
  end

  it 'cannot create a sale with failing params' do
    click_button 'Create Sale'
    select 'Princess', from: 'foreign_key'
    fill_in 'percent_off', with: '1000'
    click_button 'Submit'
    expect(current_path).to eq admin_sales_path
  end

  it 'can end an active sale' do
    sale = FactoryGirl.create(:sale, group: 'product', foreign_key: 1)
    page.driver.post toggle_status_admin_sale_path(sale)
    expect(sale.status).to eq 'active'
  end

  it 'can activate an ended sale' do
    sale = FactoryGirl.create(:sale, group: 'product', foreign_key: 1)
    page.driver.post toggle_status_admin_sale_path(sale)
    expect(sale.status).to eq 'active'
  end

  it 'can destroy an existing sale' do
    sale = FactoryGirl.create(:sale, group: 'product', foreign_key: 1)
    page.driver.submit :delete, admin_sale_path(sale), {}
    expect(Sale.all).to eq []
  end
end
