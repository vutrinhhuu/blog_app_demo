User.create! name: "Trinh Huu Vu",
             email: "vutrinhhuu@gmail.com",
             password: "xahoiden",
             password_confirmation: "xahoiden",
             admin: true,
             activated: true,
             activated_at: Time.zone.now

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Space.galaxy
  content = Faker::Space.agency
  users.each { |user| user.microposts.create!(content: content, title: title) }
end

user = User.first
microposts = Micropost.order(:created_at).take(6)
10.times do
  content = Faker::WorldCup.team
  microposts.each do |micropost|
    micropost.comments.create!(content: content, user_id: user.id)
  end
end
# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
