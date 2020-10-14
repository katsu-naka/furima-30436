FactoryBot.define do
  factory :item do
    title {"テスト"}
    description {"テスト"}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    price { 500 }
    category_id { 2 }
    status_id { 2 }
    shipping_cost_id { 2 }
    shipping_day_id { 2 }
    shipment_score_id { 2 }

    association :user
  end
end
