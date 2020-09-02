class AddPictureToFeatures < ActiveRecord::Migration[6.0]
    def change
        add_column :features, :picture, :string
    end
end
