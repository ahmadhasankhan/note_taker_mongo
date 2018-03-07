class Tagging
  include Mongoid::Document
  belongs_to :tag
  belongs_to :note
end
