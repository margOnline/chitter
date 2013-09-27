class Peep

include DataMapper::Resource

property :id, Serial
property :post, String, :length => 140
property :created, DateTime
property :maker_id, Integer

validates_length_of :post, :message => "Your peep may not be longer than 140 characters"

end