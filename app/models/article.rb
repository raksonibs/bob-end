class Article < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites
  belongs_to :location

  def self.create_seed
    locations = Location.all
    l1 = locations[Random.new().rand(locations.size).ceil()]
    letters = ('a'..'z').to_a
    randomWord = ""
    3.times {|i| randomWord << "#{letters[Random.new().rand(letters.size)]}" }
    a1 = Article.create({story: "#{randomWord} went to store", title: randomWord, publishedAt: Date.today() + 1.day, location: l1})
  end
end
