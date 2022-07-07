class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.text :company_address
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end
