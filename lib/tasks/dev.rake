namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    Phone.destroy_all
    Contact.destroy_all
    Kind.destroy_all
    Address.destroy_all

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(description: kind)
    end

    100.times do |i|
      Contact.create!(name: Faker::Name.name, 
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
        contact.phones << phone
        contact.save!
      end
    end

    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
  end
end
