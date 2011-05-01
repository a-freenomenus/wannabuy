# == Schema Information
# Schema version: 20110417150413
#
# Table name: criterions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  request_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Criterion < ActiveRecord::Base
  attr_accessible :name, :values_attributes

  belongs_to :request
  has_many :values
  
  accepts_nested_attributes_for :values, :allow_destroy => true
end
