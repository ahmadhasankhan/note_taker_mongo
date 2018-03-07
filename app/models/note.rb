class Note
  include Mongoid::Document
  field :title, type: String
  field :body, type: String

  validates_presence_of :title, :body
  validates :title, length: { minimum: 5, maximum: 300 }
  validates :body, length: {  minimum: 10, maximum: 200000}

  belongs_to :user
  has_and_belongs_to_many :tags

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip.downcase).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(', ')
  end
end
