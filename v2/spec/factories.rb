FactoryGirl.define do
  factory :adminuser do
    name 'Person'
    email 'person@example.com'
    classification 'administrator'
    password "foobar"
    password_confirmation "foobar"
    bio "ffff"
    location "USA"
    school "Hard Knocks"
    avatar "Great movie"
    country_id '2'
    # factory :admin do
    #   admin true
    # end
  end

  
end
