class Api::V1::Root < Api::Base
  include Api::V1::Base

  mount Api::V1::OrganizationsEndpoint
  mount Api::V1::MunicipalitiesEndpoint
  mount Api::V1::ServiceProvidersEndpoint
  mount Api::V1::ServiceProviders::HoursEndpoint
  # 🚅 super scaffolding will mount new endpoints above this line.

  handle_not_found
end
