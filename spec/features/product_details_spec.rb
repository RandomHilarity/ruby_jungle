require 'rails_helper'

RSpec.feature "ProductDetails", ype: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
      10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the details of one product" do
    # ACT
    visit root_path
    first('article.product img').click

    # DEBUG / VERIFY
    find('section.products-show')
    save_screenshot
    expect(page).to have_css 'section.products-show', count: 1
  end
end
