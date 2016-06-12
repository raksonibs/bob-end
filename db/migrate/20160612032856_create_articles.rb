class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :description
      t.text :state, default: 'borrowed'
      t.text :notes

      t.timestamps
    end
  end
end
