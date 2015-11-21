json.array!(@events) do |event|
  json.extract! event, :id, :event_id, :status, :title, :description
  json.url event_url(event, format: :json)
end
