namespace :utils do
  desc "Cria administradores falsos"
  task generate_admins: :environment do
      puts "Cadastrando admnistradores.."
      
      20.times do |i|
          Admin.create!(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            password: "max123", 
            password_confirmation: "max123",
            role: [0,0,1,1,1].sample
            )
        end
      puts "Administradores criados"  
  end
end
