class RemoveUserIdFromFeatures < ActiveRecord::Migration[6.0]
    def change
        remove_column :features, :user_id, :integer
    end
end
