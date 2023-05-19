# == Schema Information
#
# Table name: hospitals
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hospital < ApplicationRecord
  has_and_belongs_to_many :user

  validates_presence_of :name
end
