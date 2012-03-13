admin = 1
adam = 2
eric = 3
greg = 4
teacher = 5
donor = 6

["United States", "Uganda", "Honduras", "Thailand"].each do |name|
  Country.create!(name: name)
end

User.create!(name: "Admin", email: "admin@email.com", classification: "administrator", password_digest: "$2a$10$nM.4xm1gHkVBC25tdSf3xO9N4m7C.SMLWoaSh1.VRml862GOmbnGC", country_id: 1)
User.create!(name: "Adam", email: "adam@adamsemail.com", classification: "teacher", password_digest: "$2a$10$l2ZvnTqVQRCjAFqSjyyJhekqXJrAY8HpfMLaJ6h5YBCnLtWPgurIK", country_id: 2)
User.create!(name: "Eric", email: "eric@ericsemail.com", classification: "teacher", password_digest: "$2a$10$l2ZvnTqVQRCjAFqSjyyJhekqXJrAY8HpfMLaJ6h5YBCnLtWPgurIK", country_id: 3)
User.create!(name: "Greg", email: "bob@bobsemail.com", classification: "student", password_digest: "$2a$10$l2ZvnTqVQRCjAFqSjyyJhekqXJrAY8HpfMLaJ6h5YBCnLtWPgurIK", country_id: 4)
User.create!(name: "Teacher", email: "teacher@email.com", classification: "teacher", password_digest: "$2a$10$l2ZvnTqVQRCjAFqSjyyJhekqXJrAY8HpfMLaJ6h5YBCnLtWPgurIK", country_id: 2)
User.create!(name: "Donor", email: "donor@email.com", classification: "donor", password_digest: "$2a$10$l2ZvnTqVQRCjAFqSjyyJhekqXJrAY8HpfMLaJ6h5YBCnLtWPgurIK", country_id: 3)

Post.create!(title: "First Post", body: "First post created by Admin!", user_id: admin)
Post.create!(title: "Second Post", body: "Another post created by Admin!", user_id: admin)
Post.create!(title: "Third Post", body: "A post created by Adam!", user_id: adam)
Post.create!(title: "Fourth Post", body: "A second post created by Adam!", user_id: adam)
Post.create!(title: "Fifth Post", body: "A post created by Eric!", user_id: eric)
Post.create!(title: "Sixth Post", body: "A post created by Greg!", user_id: greg)
Post.create!(title: "Seventh Post", body: "A post created by Teacher!", user_id: teacher)
Post.create!(title: "Eighth Post", body: "A post created by Doner!", user_id: donor)

Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: admin, post_id: 1)
Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: admin, post_id: 2)
Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: adam, post_id: 3)
Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: adam, post_id: 3)
Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: adam, post_id: 3)
Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: adam, post_id: 4)
Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: eric, post_id: 5)
Attachment.create!(provider: "YouTube", attachment_url: "http://www.youtube.com/watch?v=FzRH3iTQPrk", description: "Panda Sneeze video", copyright_info: "No Copyright.", user_id: greg, post_id: 6)

Post.find_each(&:save)

puts "***Success: CONSIDER YOURSELF SEEDED!!"
