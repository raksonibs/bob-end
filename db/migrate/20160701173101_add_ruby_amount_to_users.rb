class AddRubyAmountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ruby_amount, :decimal, default: 0.0
  end
end
