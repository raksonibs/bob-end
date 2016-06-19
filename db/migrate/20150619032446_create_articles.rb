class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :location, foreign_key: true
      t.text :story
      t.string :title
      t.datetime :publishedAt

      t.timestamps
    end
  end
end
