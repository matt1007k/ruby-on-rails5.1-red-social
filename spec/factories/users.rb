FactoryGirl.define do
  factory :user do
    password "123456"
    sequence(:email){|n| "dummy_#{n}@gmail.com"}#crear un email diferente para evitar el error de unicó
  end
end
