class CreateProjects < ActiveRecord::Migration[6.0]
    def change
        create_table :projects do |t|
            t.string :projectname

            t.timestamps
        end
    end
end
