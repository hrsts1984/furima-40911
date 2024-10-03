FactoryBot.define do
  factory :item do
    association :user
    product_name { 'Evample Product' }
    description { 'This ia s description' }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_cost_id { 2 }
    shipping_area_id { 2 }
    shipping_time_id { 2 }
    price { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
