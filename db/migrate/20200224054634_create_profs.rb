class CreateProfs < ActiveRecord::Migration[6.0]
  def change
    create_table :profs do |t|
        t.string :name_prof
        t.references :peopl, foreign_key: true 
        t.timestamps
    end

  end
 
end
