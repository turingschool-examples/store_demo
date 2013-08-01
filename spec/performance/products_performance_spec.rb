require 'spec_helper'

repetitions = 30

describe "Products Performance", :type => :feature, :performance => true do
  describe "/products" do
    it "loads the products listing" do
      repetitions.times do
        visit full_url('/products')
        # Page 1 is Visible
        expect(page).to have_content('Bobby 0')
        expect(page).to have_content('The Great Fairy 1')
        
        # Other pages are not visible
        expect(page).to_not have_content('The Great Slump 1')
        expect(page).to_not have_content('Ruby 2')
      end
    end

    context 'search' do
      it "visits all the pages" do
        (repetitions/5).times do
          visit full_url('/products?search=mushroom')
          expect(page).to have_content('Mushroom 0')
          expect(page).to_not have_content('Mushroom 8')

          (2..7).each do |page_number|
            visit full_url("/products?page=#{page_number}&search=mushroom")
            expect(page).to have_content("Mushroom #{ 8 * (page_number - 1)}")
            expect(page).to_not have_content("Mushroom #{ 8 * (page_number)}")
          end
        end
      end
    end
  end
end