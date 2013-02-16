class Item
  include Mongoid::Document
  field :description, type: String
  field :estimate, type: Integer
end
