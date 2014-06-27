class AddSourceAndSlotToPiImage < ActiveRecord::Migration

  def change
    change_table :portfolio_item_images do |t|
      t.string :origin
      t.string :slot
    end
  end

end
