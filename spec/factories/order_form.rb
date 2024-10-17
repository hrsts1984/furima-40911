FactoryBot.define do
  factory :order_form do
    postal_code { "123-4567" }
    prefecture_id { 1 }
    city { "横浜市緑区" }
    addresses { "蒼山1-1" }
    building { "柳ビル103" }
    phone_number { "09012345678" }
    token { "tok_sample" }
    association :user
    association :item
  end
end