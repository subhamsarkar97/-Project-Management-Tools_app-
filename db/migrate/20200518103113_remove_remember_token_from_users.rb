class RemoveRememberTokenFromUsers < ActiveRecord::Migration[6.0]
    def change
        remove_column :users, :remember_token, :string
        add_column :users, :remember_digest, :string
    end
end
