# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Referencias
ref_act = Reference.create(unique_name: "activation", display_name: "Adesão")
ref_react = Reference.create(unique_name: "reactivation", display_name: "Recompra")

# Graduations
[
  { unique_name: "empreendedor", display_name: "Empreendedor", volume: 0, max_points_by_team: 0 },
  { unique_name: "elite", display_name: "Elite", volume: 1_500, max_points_by_team: 750 },
  { unique_name: "safira", display_name: "Safira", volume: 4_500, max_points_by_team: 2_250 },
  { unique_name: "rubi", display_name: "Rubi", volume: 9_000, max_points_by_team: 4_500 },
  { unique_name: "esmeralda", display_name: "Esmeralda", volume: 18_000, max_points_by_team: 9_000 },
  { unique_name: "diamante", display_name: "Diamante", volume: 36_000, max_points_by_team: 18_000 },
  { unique_name: "blue_diamond", display_name: "Blue Diamond", volume: 72_000, max_points_by_team: 28_800 },
  { unique_name: "red_diamond", display_name: "Red Diamond", volume: 300_000, max_points_by_team: 120_000 },
  { unique_name: "black_diamond", display_name: "Black Diamond", volume: 600_000, max_points_by_team: 200_000 },
].each do |attrs|
  Graduation.create!(attrs)
  Qualification.create!(attrs)
end

# Commissions
referral_comm_type = CommissionType.create(unique_name: "referral", display_name: "Bônus Indicação")
team_comm_type = CommissionType.create(unique_name: "team", display_name: "Bônus Equipe")
matching_comm_type = CommissionType.create(unique_name: "matching", display_name: "Bônus Equiparação")
billing_comm_type = CommissionType.create(unique_name: "billing", display_name: "Bônus Faturamento")

[
  { type: referral_comm_type, reference: ref_act, qualification: Qualification.uname(:empreendedor), display_name: "Bônus Indicação", percentage: 20, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:empreendedor), display_name: "Bônus Equipe", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:elite), display_name: "Bônus Equipe (Elite)", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:elite), display_name: "Bônus Equipe (Elite)", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:safira), display_name: "Bônus Equipe (Safira)", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:safira), display_name: "Bônus Equipe (Safira)", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:safira), display_name: "Bônus Equipe (Safira)", percentage: 5, depth: 3 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:rubi), display_name: "Bônus Equipe (Rubi)", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:rubi), display_name: "Bônus Equipe (Rubi)", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:rubi), display_name: "Bônus Equipe (Rubi)", percentage: 5, depth: 3 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:esmeralda), display_name: "Bônus Equipe", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:esmeralda), display_name: "Bônus Equipe", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:esmeralda), display_name: "Bônus Equipe", percentage: 5, depth: 3 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:esmeralda), display_name: "Bônus Equipe", percentage: 3, depth: 4 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:diamante), display_name: "Bônus Equipe", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:diamante), display_name: "Bônus Equipe", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:diamante), display_name: "Bônus Equipe", percentage: 5, depth: 3 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:diamante), display_name: "Bônus Equipe", percentage: 3, depth: 4 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:blue_diamond), display_name: "Bônus Equipe", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:blue_diamond), display_name: "Bônus Equipe", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:blue_diamond), display_name: "Bônus Equipe", percentage: 5, depth: 3 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:blue_diamond), display_name: "Bônus Equipe", percentage: 3, depth: 4 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:red_diamond), display_name: "Bônus Equipe", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:red_diamond), display_name: "Bônus Equipe", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:red_diamond), display_name: "Bônus Equipe", percentage: 5, depth: 3 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:red_diamond), display_name: "Bônus Equipe", percentage: 3, depth: 4 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:red_diamond), display_name: "Bônus Equipe", percentage: 2, depth: 5 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:black_diamond), display_name: "Bônus Equipe", percentage: 15, depth: 1 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:black_diamond), display_name: "Bônus Equipe", percentage: 5, depth: 2 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:black_diamond), display_name: "Bônus Equipe", percentage: 5, depth: 3 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:black_diamond), display_name: "Bônus Equipe", percentage: 3, depth: 4 },
  { type: team_comm_type, reference: ref_react, qualification: Qualification.uname(:black_diamond), display_name: "Bônus Equipe", percentage: 2, depth: 5 },
].each do |attrs|
  Commission.create!(attrs)
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
2.times do
  payment_attr = FactoryBot.attributes_for(:payment_method)
  payment_method = PaymentMethod.new(payment_attr)
  payment_method.save!
end

# ######################################
# Cria uma estrutura de rede de usuários
# ======================================
def create_subnetwork(sponsor)
  #Random.rand(10...20).times do
  10.times do
    user = User.new(FactoryBot.attributes_for(:user, :actived, :verified, password: "123456", sponsor: sponsor))
    user.qualifications << Qualification.uname(["empreendedor", "elite", "safira", "rubi", "esmeralda", "diamante", "blue_diamond", "red_diamond"].sample)
    user.save
    create_order(user)
  end
end

def add_points_to_user(order)
  point_dist = PointDistribution.new(done: false, params: nil, order: order)
  point_dist.user = order.user
  point_dist.reference = Reference.activation
  point_dist.base_value = order.total
  point_dist.save
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

def create_withdraw(user)
  7.times do
    Withdraw.create!(wallet: user.wallet, balance: 100.0)
  end
end

if Rails.env.development?
  # Root member
  root_attr = FactoryBot.attributes_for(:user, :root, :actived, :verified)
  root = User.new(root_attr)
  root.build_node(lft: 1, rgt: 2, depth: 0, points: 0)
  root.qualifications << Qualification.uname(:black_diamond)
  root.save!
  create_order(root)
  create_withdraw(root)

  # Childrens from root
  10.times do
    attrs = FactoryBot.attributes_for(:user, :actived, :verified, password: "123456", sponsor: root)
    sponsored = User.new(attrs)
    sponsored.qualifications << Qualification.uname(["empreendedor", "elite", "safira", "rubi", "esmeralda", "diamante", "blue_diamond", "red_diamond"].sample)
    sponsored.save

    create_order(sponsored)
    create_subnetwork(sponsored)
  end
end
