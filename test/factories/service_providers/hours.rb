FactoryBot.define do
  factory :service_providers_hour, class: 'ServiceProviders::Hour' do
    association :municipality
    name { "MyString" }
  end
end
