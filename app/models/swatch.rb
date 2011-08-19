class Swatch < ActiveRecord::Base

  belongs_to :user
  belongs_to :color

  scope :recent, limit(500).order('created_at desc')

  # has_one :color
  # validates_presence_of :user_id, :color_id
  # default_scope :order => :position
  # accepts_nested_attributes_for :color  
  # validates_associated :color

end