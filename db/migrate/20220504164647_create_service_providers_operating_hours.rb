class CreateServiceProvidersOperatingHours < ActiveRecord::Migration[7.0]
  def change
    create_table :service_providers_operating_hours do |t|
      t.references :service_provider, null: false, foreign_key: true
      t.references :hour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
