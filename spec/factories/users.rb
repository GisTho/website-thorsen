FactoryBot.define do
  sequence :email do |i|
    "gisle#{i}#{Random.rand(999)}@gislethorsen.com"
  end

  factory :user do
    email { generate(:email) }
  end

  trait :admin do
  end
end
