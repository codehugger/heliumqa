# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account = Account.create(name: 'Test Account')
site = Site.create(name: 'Test Site', account: account)
equipment = Equipment.create(name: 'Test Equipment', site: site)
profiles = EquipmentProfile.create([
  {name: 'MR', profile_data: {"0008,0060" => "MR"}, site: site},
  {name: 'CT', profile_data: {"0008,0060" => "CT"}, site: site}
])
inspection = Inspection.create(performed_at: Date.today.to_s(:db), equipment: equipment)
