# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




User.delete_all
Post.delete_all
Attachment.delete_all
User.create(name: "Greg", email: "greg@gregsemail.com", classification: "student")
User.create(name: "Adam", email: "adam@adamsemail.com", classification: "teacher")
User.create(name: "Eric", email: "eric@ericsemail.com", classification: "teacher")
User.create(name: "Bob", email: "bob@bobsemail.com", classification: "student")
User.create(name: "Admin", email: "admin@admin.com", classification: "admin")
User.create(name: "Teacher", email: "teacher", classification: "teacher")
Post.create(title: "First Post", body: "First post created by Greg!", user_id: 1)
Post.create(title: "Second Post", body: "Another post created by Greg!", user_id: 1)
Post.create(title: "Third Post", body: "A post created by Adam!", user_id: 2)
Post.create(title: "Third Post", body: "A second post created by Adam!", user_id: 2)
Post.create(title: "Fourth Post", body: "A post created by Eric!", user_id: 3)
Post.create(title: "Fifth Post", body: "A post created by Bob!", user_id: 4)
Post.create(title: "Fifth Post", body: "A second post created by Bob!", user_id: 4)
Post.create(title: "Fifth Post", body: "A third post created by Bob!", user_id: 4)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 1, post_id: 1)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 1, post_id: 2)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 2, post_id: 3)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 2, post_id: 3)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 2, post_id: 3)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 3, post_id: 4)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 4, post_id: 5)
Attachment.create(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: 4, post_id: 6)
puts "Success: Database cleared and seed.db loaded!"

