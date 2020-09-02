class AddPanelToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :panels, :string
    end
end
