require 'dm-core'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :post, String, :length => 140
  property :created_at, DateTime
  property :maker_id, Integer

  belongs_to :maker

  validates_length_of :post, :max => 140

end