class CreatePeopls < ActiveRecord::Migration[6.0]
  def change
    create_table :peopls do |t|
        t.string :fn
        t.string :sn
        t.string :tn
        t.string :dolj
        t.timestamps
      end 
    end
  end
