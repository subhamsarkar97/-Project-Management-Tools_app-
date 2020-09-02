class AddColumnCompletedAtToJobs < ActiveRecord::Migration[6.0]
    def change
        add_column :jobs, :completed_at, :string
    end
end
