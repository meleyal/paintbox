class Swatch < ActiveRecord::Base

  belongs_to :user
  belongs_to :color

  validates_presence_of :user_id, :color_id

  # default_scope :order => :position

  accepts_nested_attributes_for :color  
  validates_associated :color

end