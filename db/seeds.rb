# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

schools = School.create( [ { name: "Hanoi School", country: "Vietnam", state: "Hanoi" }, {name: "Viva Honduras", country: "Honduras", state: "El State" }])
users = User.create([ { username: "Joe Honduras", first_name: "Joe", last_name: "Honduras", email: "joe@schmoe.com", password: "password", active_author: true, school_id: schools.first, bio: "I love Vietnam" }, { username: "JoeThailand", first_name: "Joe", last_name: "Thailand", email: "joe@thailand.com", password: "password", active_author: true, school_id: schools.last, bio: "I am in Thailand." } ])

articles = Article.create([ { article_date: "2012-02-11 22:06:00", published: true, article_title: "Vietnam Video", article_body: "Video in Vietnam", article_tags: "vietnam", user_id: users.first, attachment_URL: "http://youtube.co", attachment_Description: "Video", attachment_Credits: "I did this" }, { article_date: "2012-02-11 22:06:00", published: true, article_title: "Thailand is awesome", article_body: "Thailand is awesome! Way better than Burma!", article_tags: "Thailand Burma", user_id: users.last, attachment_URL: "www.yahoo.com", attachment_Description: "Text", attachment_Credits: "I wrote dat" } ] )


