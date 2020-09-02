class AddProjectIdToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :project_id, :integer
    end
end
