class Municipality < ApplicationRecord
  # 🚅 add concerns above.

  belongs_to :organization
  # 🚅 add belongs_to associations above.

  has_many :service_providers, dependent: :destroy, enable_updates: true
  has_many :service_providers_hours, class_name: "ServiceProviders::Hour", dependent: :destroy
  has_many :service_providers_operating_hours, class_name: "ServiceProviders::OperatingHour", dependent: :destroy
  has_many :service_providers, through: :service_providers_operating_hours
  # 🚅 add has_many associations above.

  has_one :team, through: :organization
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :name, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  # 🚅 add methods above.
end
