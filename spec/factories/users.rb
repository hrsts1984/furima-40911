FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.unique.email }
    password              { 'aaa000' }
    password_confirmation { 'aaa000' }
    family_name           { '山田' }
    first_name            { '一' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'ハジメ' }
    birth_day             { '2000/01/01' }
  end
end
