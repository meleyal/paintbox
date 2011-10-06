class Swatch < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :color

  default_scope order('created_at desc')
  scope :recent, limit(500)

  validates_presence_of :user_id, :color_id
  default_scope :order => :position
  accepts_nested_attributes_for :color
  validates_associated :color

  def as_json(options = {})
    json = { 
      :color => color.value,
      :user => user.username,
      :url => user_path(user.username)
    }
  end

end