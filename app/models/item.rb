class Item
  include Mongoid::Document
  field :description, type: String
  
  embeds_many :estimations
  accepts_nested_attributes_for :estimations
end
