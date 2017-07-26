FactoryGirl.define do
  factory :item do
    name { "Iron Clock" }
    description  { "Not for ironing clothes" }
    image_url { "google.com" }
    created_at { Date.new(2012, 12, 3) }
    updated_at { Date.new(2012, 12, 3) }
  end
end
