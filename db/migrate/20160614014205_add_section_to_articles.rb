class AddSectionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :section, :text
    add_column :articles, :sub_section, :text
    add_column :articles, :title, :text
    add_column :articles, :abstract, :text
    add_column :articles, :url, :text
  end
end
