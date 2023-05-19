# == Schema Information
#
# Table name: doctors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Doctor < ApplicationRecord
  has_many :exame

  validates_presence_of :name
end
