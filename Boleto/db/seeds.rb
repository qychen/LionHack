# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Event.create!(event_id: 'v001', status:'Active', title:'title1', description:'The Memorial Tournament 6-1 Tickets - Buy and sell The Memorial Tournament')
Event.create!(event_id: 'v002', status:'Active', title:'title2', description:'hehehsadasd dsadsa www')
Event.create!(event_id: 'v003', status:'Active', title:'title3', description:'Muirfield Village Golf Club')

Ticket.create!(t_id: 't01', event_id:'v002', price:'75.0', seller_id:'s01')
Ticket.create!(t_id: 't02', event_id:'v001', price:'125.0', seller_id:'s01')
Ticket.create!(t_id: 't05', event_id:'v001', price:'125.0', seller_id:'s04')
Ticket.create!(t_id: 't03', event_id:'v001', price:'105.0', seller_id:'s03')
Ticket.create!(t_id: 't04', event_id:'v003', price:'25.0', seller_id:'s02')
