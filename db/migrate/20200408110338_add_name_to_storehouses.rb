class AddNameToStorehouses < ActiveRecord::Migration[6.0]
  def change
    add_column :storehouses, :name, :string
  end
end
