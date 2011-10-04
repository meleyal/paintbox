class Swatch < ActiveRecord::Base

  belongs_to :user
  belongs_to :color

  default_scope order('created_at desc')
  scope :recent, limit(500)

  validates_presence_of :user_id, :color_id
  default_scope :order => :position
  accepts_nested_attributes_for :color
  validates_associated :color

end