class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.string :name
      t.string :requi1
      t.string :requi2
      t.string :requi3
      t.string :requi4
      t.timestamps
    end
  end
end
