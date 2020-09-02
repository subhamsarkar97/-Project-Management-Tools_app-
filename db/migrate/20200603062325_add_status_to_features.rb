class AddStatusToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :status, :string
    end
end
