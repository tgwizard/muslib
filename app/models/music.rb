class Music
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :slug, type: String
  field :canonical_name, type: String
  field :full_name, type: String
  field :native_name, type: String # TODO: find a better term

  field :description, type: String
  field :date_written_start, type: Date
  field :date_written_end, type: Date

  attr_accessible :canonical_name, :full_name, :native_name, :description,
    :date_written_start, :date_written_end

  def to_param
    slug
  end

  def generate_slug
    self.slug = canonical_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  validates :slug, presence: true, length: { minimum: 3, maximum: 50 }
  validates :canonical_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :full_name, presence: true

  validates_uniqueness_of :slug
  validates_uniqueness_of :canonical_name
end
