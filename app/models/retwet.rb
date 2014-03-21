class Retwet < ActiveRecord::Base
	belongs_to :twet
	belongs_to :user
	# Establishes relationship between retwets and users and twets.

	validates :twet, :presence => true
	validates :user, :presence => true
end