json.extract! ticket_conversation, :id, :subject, :client_id, :manager_id, :status, :created_at, :updated_at
json.url ticket_conversation_url(ticket_conversation, format: :json)
