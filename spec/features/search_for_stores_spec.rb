require 'rails_helper'

RSpec.describe "Visitor" do
  context "searches by zipcode" do
    scenario "and sees stores within 25 miles of that zipcode" do
      VCR.use_cassette("visitor searches by zip") do

        visit root_path

        fill_in "search", with: "80202"
        click_button "Search"

        expect(current_path).to eq(search_path)
        expect(page).to have_content("Stores within 25 miles of 80202")
        expect(page).to have_content("17 Total Stores")
        expect(page).to have_css(".stores", count: 10)
        within ".stores" do
          expect(page).to have_link("#")
          expect(page).to have_content("#")
          expect(page).to have_content("#")
          expect(page).to have_content("#")
          expect(page).to have_content("#")
        end
      end
    end
  end
end

### 2. Consume Best Buy's API
#
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
