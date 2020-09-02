class RemoveFeatureWorkStatusFromFeatures < ActiveRecord::Migration[6.0]
    def change
        remove_column :features, :feature_work_status, :string
    end
end
