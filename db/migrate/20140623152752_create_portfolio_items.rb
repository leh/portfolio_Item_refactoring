class CreatePortfolioItems < ActiveRecord::Migration
  def change
    create_table :portfolio_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
