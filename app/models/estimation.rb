class Estimation
  include Mongoid::Document
  field :author, type: String
  field :effort, type: Integer

  embedded_in :item
end
