class DropTradeStates < ActiveRecord::Migration[5.2]
  def change
    drop_table :trade_states
  end
end
