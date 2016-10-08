# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

CSV.foreach('seed_csvs/markets.csv', :headers => false) do |csv_obj|
  Market.create(name: csv_obj[1], address: csv_obj[2], city: csv_obj[3], county: csv_obj[4], state: csv_obj[5], zip: csv_obj[6])
end

CSV.foreach('seed_csvs/vendors.csv', :headers => false) do |csv_obj|
  Vendor.create(name: csv_obj[1], num_employees: csv_obj[2].to_i, market_id: csv_obj[3])
end

CSV.foreach('seed_csvs/sales.csv', :headers => false) do |csv_obj|
  Sale.create(amount: csv_obj[1].to_i, purchase_time: DateTime.parse(csv_obj[2]), vendor_id: csv_obj[3].to_i, product_id: csv_obj[4].to_i)
end

CSV.foreach('seed_csvs/products.csv', :headers => false) do |csv_obj|
  Product.create(name: csv_obj[1], vendor_id: csv_obj[2].to_i)
end
