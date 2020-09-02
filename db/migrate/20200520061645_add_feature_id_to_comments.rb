class AddFeatureIdToComments < ActiveRecord::Migration[6.0]
    def change
        add_column :comments, :feature_id, :integer
    end
end
