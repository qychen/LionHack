json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :t_id, :event_id, :price, :seller_id
  json.url ticket_url(ticket, format: :json)
end
