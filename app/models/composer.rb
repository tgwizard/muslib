require 'helper_library'

class Composer
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :slug, type: String
  field :full_name, type: String
  field :english_name, type: String
  field :short_name, type: String

  field :description, type: String
  field :date_born, type: Date
  field :date_died, type: Date

  has_many :music

  attr_accessible :short_name, :full_name, :english_name, :description,
    :date_born, :date_died

  def to_param
    slug
  end

  def update_slug
    source = full_name unless full_name.blank?
    source = english_name unless english_name.blank?
    source = short_name unless short_name.blank?
    self.slug = HelperLibrary.generate_slug source unless source.nil?
  end

  validates :slug, presence: true, length: { minimum: 3, maximum: 50 }
  validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :english_name, :allow_blank => true, length: { minimum: 3, maximum: 50 }

  validates_uniqueness_of :slug, :case_sensitive => false
  validates_uniqueness_of :full_name, :case_sensitive => false
  validates_uniqueness_of :english_name, :allow_blank => true, :case_sensitive => false
  validates_uniqueness_of :short_name, :allow_blank => true, :case_sensitive => false
end
