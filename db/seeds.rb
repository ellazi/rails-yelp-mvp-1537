require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts "Creating restaurants..."

10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w(chinese italian japanese french belgian).sample
  )
  restaurant.save
  puts "Restaurant #{restaurant.name} created"
end

puts "Creating reviews..."

Restaurant.all.each do |restaurant|
  5.times do
    review = Review.create!(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
  end
end

puts "5 reviews per restaurant created"
puts "Finished!"
