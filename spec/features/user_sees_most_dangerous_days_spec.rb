require 'rails_helper'

describe 'a user' do
  it 'can search for most dangerous day based on starting and ending date' do
    visit '/'

    fill_in :start_date, with: "2018-09-08"
    fill_in :end_date,   with: "2018-09-14"
    click_on "Determine Most Dangerous Day"

    expect(current_path).to eq("/most_dangerous_day")
    expect(page).to have_content("Most Dangerous Day")
    expect(page).to have_content("January 1, 2018 - January 7, 2018")
    expect(page).to have_content("January 1, 2018")
    expect(page).to have_content("3 asteroids")

    expect(page).to have_css(".asteroid", count: 2)

    within(first(".asteroid")) do
      expect(page).to have_content("Name: (2008 KZ5)")
      expect(page).to have_content("NEO Reference ID: 3412889")
    end
    # within(second(".asteroid")) do
    #   expect(page).to have_content("Name: (2010 CO1)")
    #   expect(page).to have_content("NEO Reference ID: 3507718")
    # end
  end
end
