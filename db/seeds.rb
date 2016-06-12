
20.times do |i|
  borrow = i % 2 == 0 ? "borrowed" : "returned"
  Article.create({state: borrow, description: "#{i}"})
end


