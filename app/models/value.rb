# == Schema Information
# Schema version: 20110417150413
#
# Table name: values
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  criterion_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Value < ActiveRecord::Base
  # attr_accessible :name

  belongs_to :criterion

end
