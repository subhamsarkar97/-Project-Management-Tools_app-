class AddFeatureIdToJobs < ActiveRecord::Migration[6.0]
    def change
        add_column :jobs, :feature_id, :integer
    end
end
