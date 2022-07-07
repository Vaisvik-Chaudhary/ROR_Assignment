class Employee < ApplicationRecord
    belongs_to :company
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :mobile_number, presence:true, numericality: true, length: { is: 10 }
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
