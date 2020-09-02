class CreateFinds < ActiveRecord::Migration[6.0]
    def change
        create_table :finds do |t|
            t.string :keyword
            t.string :status

            t.timestamps
        end
    end
end
