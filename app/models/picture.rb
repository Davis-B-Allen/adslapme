class Picture < ActiveRecord::Base
  validates_uniqueness_of :uid

  belongs_to :album

	has_many :tags
	accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
