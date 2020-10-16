FactoryBot.define do
  factory :buy_item do
    zip_number { '111-1111' }
    ken_id { 2 }
    city_name { 'テスト' }
    block_name { 'テスト' }
    building_name { 'テスト' }
    phone_number { '09011111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
