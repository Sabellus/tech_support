json.extract! user, :id, :email, :role, :first_name, :last_name, :gender, :phone, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
