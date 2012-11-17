class Composer
  include Mongoid::Document

  field :name, type: String
  field :text, type: String
  field :date_born, type: Date
  field :date_died, type: Date
end
