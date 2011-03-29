# == Schema Information
# Schema version: 20110327154937
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  attr_accessible :name

  acts_as_nested_set

  has_many :requests

  validates :name, :presence => true, :uniqueness => true

end
