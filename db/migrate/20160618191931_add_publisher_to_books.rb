class AddPublisherToBooks < ActiveRecord::Migration[5.0]
  def change
     add_reference :books, :publisher, polymorphic: true, index: true
  end
end
