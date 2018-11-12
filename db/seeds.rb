10.times do
  User.create!(
    name: "Dzu Dzu" + Faker::OnePiece.character,
    email: Faker::Internet.unique.email,
    login_name: Faker::Hacker.verb,
    gender: "Male",
    password: "123456",
    password_confirmation: "123456",
    activated: true
    is_admin: false
  )
end

15.times do
  Category.create!(
    category_name: Faker::Book.unique.genre,
    category_description: Faker::Community.quotes
  )
end

100.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    publishing_company: Faker::Book.publisher,
    description: Faker::HarryPotter.quote * 3,
    category_id: 1 + rand(15),
    user_id: 1 + rand(10)
  )
end

100.times do
  Review.create!(
    review_content: Faker::HarryPotter.quote * 3,
    user_id: 1 + rand(10),
    book_id: 1 + rand(100)
  )
end
