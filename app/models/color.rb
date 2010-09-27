class Color < ActiveRecord::Base

  has_many :swatches
  
  validates_presence_of :value
  validates_length_of :value, :within => 4..7
  validates_uniqueness_of :value, :case_sensitive => false
  validates_format_of :value, :with => /^#?([a-f]|[A-F]|[0-9]){3}(([a-f]|[A-F]|[0-9]){3})?$/

end
