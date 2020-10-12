class CreateShipmentScores < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_scores do |t|

      t.timestamps
    end
  end
end
