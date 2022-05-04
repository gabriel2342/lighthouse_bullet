FactoryBot.define do
  factory :service_providers_operating_hour, class: 'ServiceProviders::OperatingHour' do
    service_provider { nil }
    hour { nil }
  end
end
