class AddUsernameToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :username, :string
    end
end
