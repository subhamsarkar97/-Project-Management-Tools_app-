class AddIdentityTokenToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :identity_token, :string
        add_index :features, :identity_token, unique: true
    end
end
