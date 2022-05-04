class CreateServiceProvidersHours < ActiveRecord::Migration[7.0]
  def change
    create_table :service_providers_hours do |t|
      t.references :municipality, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
