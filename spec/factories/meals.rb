FactoryBot.define do
  factory :meal do
    name { ['lunch', 'dinner' ,'breakfast' , 'snack'].sample }
  end
end
