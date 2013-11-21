class Profile < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :projects
	has_many :microposts

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

end
