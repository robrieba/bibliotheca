require 'faker'

20.times do
  city = Faker::Address.city
  library = Library.create!( branch: "#{city} Branch", location: "#{city}",
    description: Faker::Lorem.sentence, image_url: Faker::Placeholdit.image("360x240") )

  50.times do
    library.books.create!( title: Faker::Book.title,
      isbn: Faker::Code.isbn,
      author: Faker::Book.author,
      publisher: Faker::Book.publisher,
      copies: (0..5).to_a.sample,
      image_url: Faker::Placeholdit.image("65x100"))
  end

end
