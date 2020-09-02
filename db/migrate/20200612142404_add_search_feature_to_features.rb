class AddSearchFeatureToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :panel_search, :string
        add_column :features, :unique_id, :integer
    end
end
