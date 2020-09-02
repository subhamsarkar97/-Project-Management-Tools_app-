class AddMailIdToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :mailId, :string
    end
end
