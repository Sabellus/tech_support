class TechSupportAPI < Grape::API 
    prefix 'api'
    format :json

    mount TechSupport::Conversations
end