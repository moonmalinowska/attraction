class Attraction < ActiveRecord::Base

  belongs_to :region, :class_name => "Region", :foreign_key => :region_id
  belongs_to :category, :class_name => "Category", :foreign_key => :category_id
  belongs_to :variety, :class_name => "Variety", :foreign_key => :variety_id
  accepts_nested_attributes_for :category


  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  class << self
    delegate :search, to: :__elasticsearch__ unless respond_to?(:search)
  end

  acts_as_taggable
  @tags = Attraction.tag_counts_on(:tags)

  has_attached_file :picture, :default_url => "/images/:style/missing.png", styles: {thumb: "300x300"}
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address
  # geocoded_by :full_address # can also be an IP address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode # auto-fetch coordinates


  validates :name, presence: true, uniqueness: true, length: {within: 2..100}
  validates :description, presence: true, length: {minimum: 10}
  validates_presence_of :address, :opening_hour, :duration, :reservation, :picture
  validates_presence_of :region_id, :category_id, :variety_id
  validates_length_of :more_info, :minimum => 5, :allow_blank => true
  #validates :picture, :attachment_presence => true


  #filterrific(
  #    default_filter_params: { sorted_by: 'created_at_desc' },
  #    available_filters: [
  #        :sorted_by,
  #        :search_query,
  #        :with_region_id,
  #        :with_created_at_gte
  #    ]
  #)
  #geocoder
  #def full_address
  #   "#{address} Japan"
  # end

  #scope :sorted_by, lambda { |actiontypes|
  #                  order("attractions.created_at desc")
  #                }


  #scope :with_region_id, lambda { |actiontypes|
  #                       where(actiontype_id: [*actiontypes])
  #                       where(reviewed: true)
  #                     }


  Attraction.import

end
