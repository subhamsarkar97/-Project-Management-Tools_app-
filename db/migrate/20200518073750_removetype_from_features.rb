class RemovetypeFromFeatures < ActiveRecord::Migration[6.0]
    def change
        remove_column :features, :type, :string
        add_column :features, :feature_work_status, :string  
    end
end
