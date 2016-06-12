class Article < ActiveRecord::Base
  validates :description, presence: true
  validates :state, presence: true, inclusion: { in: %w(borrowed returned) }
  # counter_culture :friend, column_name: :total_articles
end
