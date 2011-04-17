class Criterion < ActiveRecord::Base
  belongs_to :request
  has_many :values
end
