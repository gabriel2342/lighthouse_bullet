class ServiceProvider < ApplicationRecord
  # 🚅 add concerns above.

  belongs_to :municipality
  # 🚅 add belongs_to associations above.

  has_many :operating_hours, class_name: "ServiceProviders::OperatingHour", dependent: :destroy
  has_many :municipalities, through: :operating_hours
  # 🚅 add has_many associations above.

  has_one :team, through: :municipality
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :name, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  def valid_hours
    raise "please review and implement `valid_hours` in `app/models/service_provider.rb`."
    # please specify what objects should be considered valid for assigning to `hour_ids`.
    # the resulting code should probably look something like `team.hours`.
    team.service_provider_hours

  end

  # 🚅 add methods above.
end
