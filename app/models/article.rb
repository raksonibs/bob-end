class Article < ActiveRecord::Base
  validates :title, uniqueness: true
  # validates :state, presence: true, inclusion: { in: %w(borrowed returned) }
  # counter_culture :friend, column_name: :total_articles
end
