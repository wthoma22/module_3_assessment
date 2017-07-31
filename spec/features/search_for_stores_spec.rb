require 'rails_helper'

RSpec.describe "Visitor" do
  context "searches by zipcode" do
    scenario "and sees stores within 25 miles of that zipcode" do
      VCR.use_cassette("visitor searches by zip") do

        visit root_path

        fill_in "find", with: "80202"
        click_on "Search"

        expect(current_path).to eq(search_path)
        expect(page).to have_content("17 Total Stores")
        within ".search-results" do
          expect(page).to have_selector(".store", count: 10)
          within ".store-1" do
            expect(page).to have_selector(".long-name")
            expect(page).to have_selector(".city")
            expect(page).to have_selector(".distance")
            expect(page).to have_selector(".phone-number")
            expect(page).to have_selector(".store-type")
        end
      end
    end
  end
end
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
#
# (Additional Functionality)
#
# And I should see pagination links below the search results for the number of pages (2 in this case)
# And `1` is my current page but isn't a clickable link
# And `2` is a clickable link
# When I click `2`
# Then I should be taken to the next page of search results
# Then my current path should be "/search" (ignoring params)
# And in the params I should see `page=2`
# And I should see stores within 25 miles
# And I should see a message that says "17 Total Stores"
# And I should see the next 6 results
# And I should see the long name, city, distance, phone number and store type for each of the next 6 results
