require 'spec_helper'

describe 'user rates product' do

  before(:each) do
    @user = FactoryGirl.create(:user)
    visit '/login'
    fill_in 'sessions_email', with: 'alice@example.com'
    fill_in 'sessions_password', with: 'password'
    click_button 'Login'
  end

  context 'when they have purchased a product' do
    before(:each) do
      @order = FactoryGirl.create(:order, user: @user)
      @order.order_items = [FactoryGirl.create(:order_item)]
    end

    it 'they can rate a product' do
      visit account_ratings_path
      click_link 'Rate this product'
      fill_in 'Title', with: 'Love it'
      fill_in 'Body', with: 'Get it get it get itttt'
      select '4', from: 'Stars'
      click_button 'Submit'
      expect(page).to have_content('Love it')
    end

    it 'their rating fails with incorrect params' do
      visit account_ratings_path
      click_link 'Rate this product'
      fill_in 'Body', with: 'Get it get it get itttt'
      select '4', from: 'Stars'
      click_button 'Submit'
      expect(page).to have_content("can't be blank")
    end

    it 'they can edit a rating left within the last 15 minutes' do
      product = FactoryGirl.create(:product, title: 'Princess')
      rating = FactoryGirl.create(:rating, user_id: @user.id, product_id: product.id)
      visit edit_product_rating_path(product, rating)
      expect(page).to have_content('Edit your rating of')
      fill_in 'Title', with: 'CHANGED MY MIND!'
      click_button 'Submit'
      expect(current_path).to eq account_ratings_path
    end

    it 'their edit fails with missing information' do
      product = FactoryGirl.create(:product, title: 'Princess')
      rating = FactoryGirl.create(:rating, user_id: @user.id, product_id: product.id)
      visit edit_product_rating_path(product, rating)
      expect(page).to have_content('Edit your rating of')
      fill_in 'Title', with: ''
      click_button 'Submit'
      expect(page).to have_content("can't be blank")
    end
  end
end
