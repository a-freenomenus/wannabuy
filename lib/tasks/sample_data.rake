require 'faker'

namespace :db do
  desc 'Fill db with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => 'Example User',
                 :email => 'example@example.by',
                 :password => 'password',
                 :password_confirmation => 'password')
    admin = User.create!(:name => 'Administrator',
                         :email => 'admin@example.by',
                         :password => 'password',
                         :password_confirmation => 'password')
    admin1 = User.create!(:name => 'Leaser Geen',
                         :email => 'leaser.geen@gmail.com',
                         :password => 'password',
                         :password_confirmation => 'password')
    admin1.toggle!(:admin)
    admin.toggle!(:admin)

    User.all(:limit => 6).each do |user|
      5.times do
        @r = user.requests.build( :name       => Faker::Lorem.sentence(5),
                                  :description => Faker::Lorem.sentence(33))
        @r.status = 'started'
        @r.save
      end
      15.times do
        @r = user.requests.build( :name        => Faker::Lorem.sentence(6),
                                  :description => Faker::Lorem.sentence(44))
        @r.status = 'not-started'
        @r.save
      end
      3.times do
        @r = user.requests.build( :name        => Faker::Lorem.sentence(6),
                                  :description => Faker::Lorem.sentence(44))
        @r.status = 'finished'
        @r.save
      end
      4.times do
        @r = user.requests.build( :name        => Faker::Lorem.sentence(6),
                                  :description => Faker::Lorem.sentence(44))
        @r.status = 'closed'
        @r.save
      end
    end

    # Create categories
    clothes = Category.create!(:name => 'Одежда. Обувь. Аксессуары')
      cloth = Category.create!(:name => 'Одежда')
      cloth.move_to_child_of(clothes)
      boots = Category.create!(:name => 'Обувь')
      boots.move_to_child_of(clothes)
      clothes_acsessories = Category.create!(:name => 'Аксессуары') 
      clothes_acsessories.move_to_child_of(clothes)

    phones = Category.create!(:name => 'Мобильные телефоны. Смартфоны. КПК')
      smart = Category.create!(:name => 'Смартфоны')
      smart.move_to_child_of(phones)
      mobile = Category.create!(:name => 'Мобильные телефоны')
      mobile.move_to_child_of(phones)
      kpk = Category.create!(:name => 'КПК')
      kpk.move_to_child_of(phones)
 
    computers = Category.create!(:name => 'Компьютеры. Ноутбуки. Комплектующие')
      comp = Category.create!(:name => 'Персональные компьютеры')
      comp.move_to_child_of(computers)
      noteb = Category.create!(:name => 'Ноутбуки')
      noteb.move_to_child_of(computers)
      kompl = Category.create!(:name => 'Комплектующие')
      kompl.move_to_child_of(computers)

    foto = Category.create!(:name => 'Фото и Видео')
      foto_app = Category.create!(:name => 'Фотоаппараты')
      foto_app.move_to_child_of(foto)
      obj = Category.create!(:name => 'Объективы')
      obj.move_to_child_of(foto)
      f_acces = Category.create!(:name => 'Фото-аксессуары')
      f_acces.move_to_child_of(foto)
  
    audio = Category.create!(:name => 'Аудио и Видео')
      a_t  = Category.create!(:name => 'Аудиотехника')
      a_t.move_to_child_of(audio)
      v_t = Category.create!(:name => 'Видеотехника')
      v_t.move_to_child_of(audio)

    office = Category.create!(:name => 'Офисная техника')
    auto = Category.create!(:name => 'Автомобили и запчасти')
      a1 =  Category.create!(:name => 'Автомобили')
      a1.move_to_child_of(auto)
      a_z =  Category.create!(:name => 'Запасные части')
      a_z.move_to_child_of(auto)

    home_technics = Category.create!(:name => 'Техника для дома')
    services = Category.create!(:name => 'Услуги')
    other = Category.create!(:name => 'Другое')
    real_estate = Category.create!(:name => 'Недвижимость')
    entertainment = Category.create!(:name => 'Развлечения. Хобби')
      instruments = Category.create!(:name => 'Музыкальные инструменты')
      instruments.move_to_child_of(entertainment)


  end
end

