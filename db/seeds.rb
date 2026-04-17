products = [
  { title: "Wireless Bluetooth Headphones", description: "High-quality over-ear headphones with noise cancellation and 30-hour battery life.", price_cents: 7999, stock_level: 150, published_at: Time.current },
  { title: "Stainless Steel Water Bottle", description: "Double-walled insulated bottle that keeps drinks cold for 24 hours or hot for 12 hours. 750ml capacity.", price_cents: 2499, stock_level: 300, published_at: Time.current },
  { title: "Mechanical Keyboard", description: "Compact 75% layout mechanical keyboard with RGB backlighting and hot-swappable switches.", price_cents: 12999, stock_level: 75, published_at: Time.current },
  { title: "Organic Cotton T-Shirt", description: "Soft and breathable crew neck t-shirt made from 100% certified organic cotton. Available in multiple colors.", price_cents: 3500, stock_level: 500, published_at: Time.current },
  { title: "Portable Phone Charger", description: "20,000mAh power bank with dual USB-C ports and fast charging support. Slim and lightweight design.", price_cents: 4599, stock_level: 200, published_at: Time.current },
  { title: "Cast Iron Skillet", description: "Pre-seasoned 12-inch cast iron skillet suitable for stovetop, oven, and campfire cooking.", price_cents: 3999, stock_level: 120, published_at: Time.current },
  { title: "Yoga Mat", description: "Extra thick 6mm non-slip yoga mat with alignment lines. Eco-friendly TPE material.", price_cents: 2999, stock_level: 250, published_at: nil },
  { title: "LED Desk Lamp", description: "Adjustable LED desk lamp with 5 brightness levels, 3 color temperatures, and USB charging port.", price_cents: 5499, stock_level: 180, published_at: Time.current },
  { title: "Leather Notebook", description: "A5 hardcover notebook with 200 pages of acid-free lined paper and a genuine leather cover.", price_cents: 1999, stock_level: 400, published_at: Time.current },
  { title: "Running Shoes", description: "Lightweight running shoes with responsive cushioning and breathable mesh upper. Ideal for daily training.", price_cents: 8999, stock_level: 0, published_at: nil }
]

products.each do |attrs|
  Product.create!(attrs)
end

puts "Created #{Product.count} products."
