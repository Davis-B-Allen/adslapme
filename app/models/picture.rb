class Picture < ActiveRecord::Base
	validates :faceid, :presence => true
	validates :url, :presence => true

	has_many :tags
	accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
