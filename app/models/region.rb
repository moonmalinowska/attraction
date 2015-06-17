class Region < ActiveRecord::Base
  has_many :attractions

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  class << self
    delegate :search, to: :__elasticsearch__ unless respond_to?(:search)
  end

  validates :name, presence: true, length: {within: 2..100}

  Region.import
end
