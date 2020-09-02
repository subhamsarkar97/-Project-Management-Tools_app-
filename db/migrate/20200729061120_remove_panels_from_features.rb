class RemovePanelsFromFeatures < ActiveRecord::Migration[6.0]
  def change

    remove_column :features, :panels, :string
  end
end
