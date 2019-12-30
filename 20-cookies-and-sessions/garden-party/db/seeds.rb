puts "Resetting gardens..."
Garden.destroy_all

puts "Making gardens..."
20.times do
  Garden.create(
    name: "#{Faker::Games::Pokemon.location} Garden",
    width: 5 * rand(1..3),
    length: 5 * rand(1..3),
    staff_count: rand(1..100)
  )
end

puts "Making plants..."
plant_emojis = %w(🌵 🎄 🌲 🌳 🌴 🌱 🌿 ☘️ 🍀 🍄 🌾 💐 🌷 🌺 🌸 🍏 🍎 🍐 🍋 🍒 🥕 🥔 🍍 🍉 🌽 🍇)

Garden.all.each do |garden|
  rand(10..20).times do
    x = rand(0...(garden.width - 4))
    y = rand(0...(garden.length - 4))
    Plant.create(
      garden: garden,
      color: Plant.valid_colors.sample,
      x: x,
      y: y,
      width: rand(1..2),
      length: rand(1..2),
      emoji: plant_emojis.sample
    )
  end
end

puts "Done 🌱"