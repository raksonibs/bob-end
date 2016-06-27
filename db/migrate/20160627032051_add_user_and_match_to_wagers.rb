class AddUserAndMatchToWagers < ActiveRecord::Migration[5.0]
  def change
    add_reference :wagers, :user, foreign_key: true
    add_reference :wagers, :match, foreign_key: true
  end
end
