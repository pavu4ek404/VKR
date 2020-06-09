class AddTimeToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :time, :datetime
  end
end
