namespace :db do
    desc "Seed the database with sample data"
    task seed: :environment do
      10.times do
        user = User.create!(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          password_digest: BCrypt::Password.create("password")
        )
  
        5.times do
          Todo.create!(
            title: Faker::Lorem.sentence(word_count: 3),
            completed: [true, false].sample,
            user_id: user.id
          )
        end
      end
    end
  end
  