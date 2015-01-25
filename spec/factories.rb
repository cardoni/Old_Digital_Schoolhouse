FactoryGirl.define do
  # this must match the name of the table
  factory :user do
    name 'Person'
    email 'person@example.com'
    classification 'student'
    password "foobar"
    password_confirmation "foobar"
    bio "ffff"
    location "USA"
    school "Hard Knocks"
    avatar "Great movie"
    country_id '2'
    
    factory :adminuser do
        classification 'administrator'
    end
  end

  
end
