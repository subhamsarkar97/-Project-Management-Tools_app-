class RemoveDoneFromJobs < ActiveRecord::Migration[6.0]
    def change
        remove_column :jobs, :done, :boolean
    end
end
