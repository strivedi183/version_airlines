# == Schema Information
#
# Table name: voyages
#
#  id              :integer          not null, primary key
#  code            :string(255)
#  airfield_depart :string(255)
#  airfield_arrive :string(255)
#  voyage_date     :date
#  zeppelin_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Voyage < ActiveRecord::Base
  attr_accessible :code, :airfield_depart, :airfield_arrive, :voyage_date, :zeppelin_id
  belongs_to :zeppelin, :inverse_of => :voyages
  has_many :bookings
  has_many :seats, :through => :bookings
  has_many :travelers, :through => :bookings
  validates :zeppelin_id, :presence => true
end
