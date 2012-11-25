require 'helper_library'

class Music
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :slug, type: String
  field :full_name, type: String
  field :english_name, type: String

  field :description, type: String
  field :date_written_start, type: Date
  field :date_written_end, type: Date

  belongs_to :composer

  attr_accessible :full_name, :english_name, :description,
    :date_written_start, :date_written_end

  def to_param
    slug
  end

  def update_slug
    source = full_name unless full_name.blank?
    source = english_name unless english_name.blank?
    name_slug = HelperLibrary.generate_slug source unless source.nil?
    self.slug = "#{composer.slug}-#{name_slug}" unless source.nil? || composer.nil?
  end

  validates :slug, presence: true, length: { minimum: 3, maximum: 50 }
  validates :full_name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :english_name, :allow_blank => true, length: { minimum: 3, maximum: 50 }

  validates :composer, :presence => true

  validates_uniqueness_of :slug, :case_sensitive => false
  validates_uniqueness_of :full_name, :case_sensitive => false
  validates_uniqueness_of :english_name, :allow_blank => true, :case_sensitive => false
end
