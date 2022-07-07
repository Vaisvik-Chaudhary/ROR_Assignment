json.extract! employee, :id, :first_name, :last_name, :mobile_number, :address, :email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
