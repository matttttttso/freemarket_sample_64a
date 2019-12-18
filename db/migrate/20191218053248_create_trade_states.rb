class CreateTradeStates < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_states do |t|
      t.string :trade_state, null: false
      t.integer :buyer_id
      t.references :item,    foreign_key: true

      t.timestamps
    end
  end
end
