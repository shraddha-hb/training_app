class User < ApplicationRecord
	validates :first_name, :presence =>true
	validates :last_name, :presence =>true
	validates :email, :presence =>true, :uniqueness => true

	scope :active_user, -> {where(:active=>true)}
	scope :inactive_user, -> {where(:active=>false)}

	@user
end
