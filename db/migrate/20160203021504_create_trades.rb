class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :team_1_id
      t.integer :team_2_id
      t.integer :year
      t.integer :month

      t.timestamps null: false
    end
  end
end
