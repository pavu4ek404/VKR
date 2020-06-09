class CreateExplosives < ActiveRecord::Migration[6.0]
  def change
    create_table :explosives do |t|
      t.string :name
      t.float :oxygen
      t.float :heat
      t.float :speed

      t.timestamps
    end
  end
end
