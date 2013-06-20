require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'


desc "create the database"
task "db:create" do
  touch 'db/ar-address.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-address.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end


desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end


desc 'Contacts Data'
task "db:seed" do
  100.times do
    contact = Contact.new
    until contact.valid?
      contact = Contact.new(  :first_name => Faker::Name.first_name,
                              :email => Faker::Internet.email,
                              :phone_number => Faker::PhoneNumber.phone_number,
                              :company => Faker::Company.name)
    end
    contact.save

  end
end

# desc 'Map Students'
# task "db:assign_student" do
#   ids1 = Teacher.pluck(:id)
#   ids2 = Student.pluck(:id)

#   100.times do
#     StudentTeacher.create(teacher_id: ids1.sample, student_id: ids2.sample)
#   end
# end

desc 'Driver Code'
task "db:driver" do
  dude1 = Contact.find(28)
  dude2 = Contact.find(1)

  p dude2.name
  p dude1.name

end
