class AddUserIdToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :user_id, :integer
    end
end

