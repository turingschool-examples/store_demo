users = [
  {
    full_name: "George Jetson",
    email: "george@example.com",
    password: "password"
  },
  {
    full_name: "Judy Jetson",
    email: "judy@example.com",
    password: "password",
    display_name: "jj"
  },
  {
    full_name: "Rosie the Robot",
    email: "rosie@example.com",
    password: "password",
    display_name: "RR836", admin: true
  }
]

users.each do |data|
  User.create data
end

product_details = [
  {title: "Bobby", description: "Marcy's triplet brother. He's kind of smelly.", price: 14.19, status: 'active', image_path: '/images/creatures/stickers/bobby-02.png' },
  {title: "Ruby (green)", description: "We <3 it.", price: 120.19, status: 'active', image_path: '/images/creatures/stickers/ruby-green.png' },
  {title: "Dust Bunny", description: "We swear Frank didn't get his inspiration from Kirby.", price: 2.50, status: 'active', image_path: '/images/creatures/stickers/dust-bunny.png' },
  {title: "The Great Fairy", description: "She'll heal you when you're low on hearts. Keep her in a bottle.", price: 23.90, status: 'active', image_path: '/images/creatures/stickers/fairy.png' },
  {title: "The Great Slump", description: "The Great Slump has a single claw arm.", price: 272.30, status: 'active', image_path: '/images/creatures/stickers/great-slump.png' },
  {title: "Madam Mushroom", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 104.19, status: 'active', image_path: '/images/creatures/stickers/madame-mushroom.png' },
  {title: "Macy", description: "Macy, Marcy's triplet sister, is a tom-boy at heart.", price: 104.19, status: 'active', image_path: '/images/creatures/stickers/marcy-02.png' },
  {title: "Marcy", description: "The one and only (except for her siblings).", price: 104.19, status: 'active', image_path: '/images/creatures/stickers/marcy.png' },
  {title: "Ruby (blue)", description: "We <3 it.", price: 104.19, status: 'active', image_path: '/images/creatures/stickers/ruby-blue.png' },
  {title: "Madam Mushroom (yellow)", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 104.19, status: 'active', image_path: '/images/creatures/stickers/madame-mushroom-yellow.png' },
  {title: "Senior Marshmellow", description: "Unfortunately he never learned how to spell his name correctly.", price: 74.44, status: 'active', image_path: '/images/creatures/stickers/senor-marshmellow.png' },
  {title: "Slump, Sr.", description: "The grandfather of all hairballs. He was in a war once, you know.", price: 34.07, status: 'active', image_path: '/images/creatures/stickers/slump-sr.png' },
  {title: "Slumpy", description: "The daddy of the bunch.", price: 104.19, status: 'active', image_path: '/images/creatures/stickers/slumpy.png' },
  {title: "Over-Saturated Slumpy", description: "Slumpy really hates being put in the microwave.", price: 1001.87, status: 'active', image_path: '/images/creatures/stickers/soaked-slumpy.png' },
  {title: "Madam Mushroom (purple)", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 1235.99, status: 'active', image_path: '/images/creatures/stickers/madame-mushroom-purple.png' },
  {title: "Ruby", description: "We <3 it.", price: 1.19, status: 'active', image_path: '/images/creatures/stickers/ruby.png' },
  {title: "Dust Bunny (purple)", description: "We swear Frank didn't get his inspiration from Kirby.", price: 17.95, status: 'active', image_path: '/images/creatures/stickers/dust-bunny-purple.png' },
  {title: "Squint", description: "Expert piano player", price: 24.00, status: 'active', image_path: '/images/creatures/stickers/squint.png' },
  {title: "The Viking", description: "He's really a big softy at heart.", price: 4.70, status: 'active', image_path: '/images/creatures/stickers/viking.png' },
  {title: "The Wizard", description: "Cranky, hates kids, and doesn't smell very good. I heard he's related to Dumbledore's second cousin.", price: 99.50, status: 'active', image_path: '/images/creatures/stickers/wizard.png' },
]

product_details.each do |product|
  Product.create(product)
end

category_sets = [
  { title: "Hairballs", product_ids: [1, 5, 7, 8, 12, 13, 14] },
  { title: "Mystics", product_ids: [3, 4, 6, 10, 11, 15, 17, 18, 20] },
  { title: "Bunnies", product_ids: [3, 17] },
  { title: "Brutes", product_ids: [19, 20, 11] },
  { title: "Miscellaneous", product_ids: [2, 9, 16, 4, 15, 18] },
]

category_sets.each do |category_set|
  category = Category.create(:title => category_set[:title])
  category_set[:product_ids].each do |product_id|
    base_product = Product.find(product_id)
    root_name = base_product.title.gsub(" 0", "")
    category.products << Product.where('title like ?', root_name + "%")
    category.save
  end
end

