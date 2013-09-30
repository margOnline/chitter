require 'dm-core'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :post, String
  property :created_at, DateTime
  property :maker_id, Integer

  belongs_to :maker

  validates_length_of :post, :max => 140, :message => 'Peeps can not be more than 140 characters'
  validates_presence_of :post, :message => 'Please enter a peep'
end