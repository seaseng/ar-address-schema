require_relative '../config'

# this is where you should use an ActiveRecord migration to Create Contacts.

class CreateContacts < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table  :contacts do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :company
      t.string    :phone_number
      t.string    :email
    end
  end
end
