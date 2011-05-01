# == Schema Information
# Schema version: 20110501132657
#
# Table name: ratings
#
#  id          :integer         not null, primary key
#  value       :integer
#  response_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Rating < ActiveRecord::Base
  belongs_to :response
  belongs_to :user

  validates :value, :presence => true
  validates :user_id, :presence => true
  validates :response_id, :presence => true
  validates_numericality_of :value, :only_integer => true
end
