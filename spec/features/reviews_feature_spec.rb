require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "Amazing fried chicken. I would sell my soul for it."
    select '5', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('Amazing fried chicken. I would sell my soul for it.')
  end
end
