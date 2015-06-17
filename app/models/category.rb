class Category < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :attractions
  accepts_nested_attributes_for :attractions

  class << self
    delegate :search, to: :__elasticsearch__ unless respond_to?(:search)
  end
  validates :name, presence: true, length: {within: 2..100}
  Category.import
end
