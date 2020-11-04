# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with(:truncation,except: %w(ar_internal_metadata))


['mrosso10@gmail.com','luciano.santobuono@gmail.com',
 'lucasrossi90@gmail.com','ignacio.coluccio@gmail.com'].each do |mail|
  unless User.exists?(email: mail)
    User.create(email: mail, password: 'admin123', password_confirmation: 'admin123', profiles: ["0", "1"], 
                desarrollador: true)
  end
end

FactoryBot.create_list(:admin_post_category, 10)
FactoryBot.create_list(:admin_post, 50, :post_category_existente)
