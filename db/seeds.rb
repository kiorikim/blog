# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
articles = Article.all
users = User.all
counter = 1
articles.each do |article|
    article.user_id = counter
    counter+=1
    if counter > users.size
      counter=1
    end
    article.save
end
