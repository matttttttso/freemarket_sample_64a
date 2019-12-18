class CreateTradeStates < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_states do |t|

      t.timestamps
    end
  end
end
