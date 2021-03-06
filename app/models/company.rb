class Company < ApplicationRecord
    has_many :employees, dependent: :destroy

    validates :company_name, :company_address, presence: true
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }    
    validates :mobile, presence:true, numericality: true, length: { is:10 }
end
