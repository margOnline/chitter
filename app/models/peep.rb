require 'dm-core'
require 'dm-timestamps'

class Peep

include DataMapper::Resource

property :id, Serial
property :post, String, :length => 140
property :created_at, DateTime
property :maker_id, Integer

validates_length_of :post, :message => "Your peep may not be longer than 140 characters"

  def self.order_by(property, direction = :asc)
    order = DataMapper::Query::Direction.new(property, direction)
    query = all.query
    # query.instance_variable_set("@order", [order])
    # query.instance_variable_set("@links", [relationships['vehicle'].inverse])
    all(query)
  end

end