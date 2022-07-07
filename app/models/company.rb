class Company < ApplicationRecord
    has_many :employees, dependent: :destroy

    validates :company_name, presence: true
    validates :company_address, presence: true
    validates :email, presence: true, uniqueness: true
    validates :mobile, presence:true, numericality: true, length: { is:10 }
end
