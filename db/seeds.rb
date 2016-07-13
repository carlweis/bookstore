require 'ffaker'

# remove existing products
LineItem.delete_all
Product.delete_all

# seed 100 random products
100.times do |i|
  product_title = FFaker::Product.product
  Product.create!(
    title: "#{product_title}#{i}",
    description: FFaker::Lorem.paragraph(1),
    price: rand(1...100).to_f,
    image_url: "#{product_title.parameterize}.jpg"
  )
end
