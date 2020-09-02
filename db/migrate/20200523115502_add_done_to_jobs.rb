class AddDoneToJobs < ActiveRecord::Migration[6.0]
    def change
        add_column :jobs, :done, :boolean
    end
end
