require_relative '../../db/config'

# implement your Contact model here
class Contact < ActiveRecord::Base

  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }
  validates :phone_number, :format => { :with => /\d{3}-\d{3}-\d{4}/, :message => "Invalid Phone"}
  validates :company, :presence => true

  def name
    self[:first_name] + ' ' + self[:last_name] 
  end

  def email
    self[:email]
  end

  def company
    self[:company]
  end

  def phone_number
    self[:phone_number]
  end

end
