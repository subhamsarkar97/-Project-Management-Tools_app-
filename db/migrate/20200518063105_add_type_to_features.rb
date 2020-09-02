class AddTypeToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :type, :string
    end
end
