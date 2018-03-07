class Tag
  include Mongoid::Document
  field :name, type: String
  has_and_belongs_to_many :notes
  validates_uniqueness_of :name, case_sensitive: false
end
