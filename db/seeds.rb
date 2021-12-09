# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Graduations
[
  { title: "Empreendedor", volume: 0, max_points_by_team: 0 },
  { title: "Elite", volume: 1_500, max_points_by_team: 750 },
  { title: "Safira", volume: 4_500, max_points_by_team: 2_250 },
  { title: "Rubi", volume: 9_000, max_points_by_team: 4_500 },
  { title: "Esmeralda", volume: 18_000, max_points_by_team: 9_000 },
  { title: "Diamante", volume: 36_000, max_points_by_team: 18_000 },
  { title: "Blue Diamond", volume: 72_000, max_points_by_team: 28_800 },
  { title: "Red Diamond", volume: 300_000, max_points_by_team: 120_000 },
  { title: "Black Diamond", volume: 600_000, max_points_by_team: 200_000 },
].each do |attrs|
  Graduation.create!(attrs)
  Qualification.create!(attrs)
end

# Product Categories
[
  { name: "acessorios", display_name: "Acessórios", is_default: false },
  { name: "coloracao", display_name: "Coloração", is_default: false },
  { name: "descoloracao", display_name: "Descoloração", is_default: false },
  { name: "kits_adesao", display_name: "Kits Adesão", is_default: false },
  { name: "manutencao", display_name: "Manutenção", is_default: false },
  { name: "naturais", display_name: "Naturais", is_default: false },
  { name: "perfumes", display_name: "Perfumes", is_default: false },
  { name: "profissional", display_name: "Profissional", is_default: false },
  { name: "capilar", display_name: "Capilar", is_default: false },
  { name: "barbearia", display_name: "Barbearia", is_default: false },
  { name: "cosmeticos", display_name: "Cosméticos", is_default: false },
  { name: "oleos_essenciais", display_name: "Óleos Essenciais", is_default: false },
].each do |attrs|
  category = ProductCategory.new(attrs)
  category.save

  # Faker products
  10.times do
    product_attr = FactoryBot.attributes_for(:product, :published)
    product = Product.new(product_attr)
    product.category = category
    product.save
  end
end

# Faker payment methods
10.times do
  payment_attr = FactoryBot.attributes_for(:payment_method)
  payment_method = PaymentMethod.new(payment_attr)
  payment_method.save!
end

# Root member
root_attr = FactoryBot.attributes_for(:user, :root, :actived, :verified)
root = User.new(root_attr)
root.save!

def create_subnetwork(sponsor)
  Random.rand(1...5).times do
    user = User.new(FactoryBot.attributes_for(:user, :actived, :verified, sponsor: sponsor))
    user.save
    create_order(user)
  end
end

def add_points_to_user(order)
  point_dist = PointDistribution.new(done: false, params: nil, order: order)
  point_dist.user = order.user
  point_dist.reference = FactoryBot.create(:reference)
  point_dist.base_value = order.total
  point_dist.save!
end

def add_order_items_and_save_order(order, product)
  order_item = OrderItem.new(FactoryBot.attributes_for(:order_item))
  order_item.product = product
  order.items << order_item
  order.save
  add_points_to_user(order)
end

def create_order(user)
  order = Order.new(FactoryBot.attributes_for(:order, status: "paid"))
  order.user = user
  order.billing_address = FactoryBot.build(:address, building_number: 100)
  order.shipping_address = FactoryBot.build(:address, building_number: 200)
  add_order_items_and_save_order(order, Product.first)
end

# Childrens from root
childrens = Random.rand(10...20)
childrens.times do
  attrs = FactoryBot.attributes_for(:user, :actived, :verified, sponsor: root)
  sponsored = User.new(attrs)
  sponsored.save!

  create_subnetwork(sponsored)
end
