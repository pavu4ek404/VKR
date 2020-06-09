class AddNameToContracts < ActiveRecord::Migration[6.0]
  def change
    add_column :contracts, :name, :string
  end
end
