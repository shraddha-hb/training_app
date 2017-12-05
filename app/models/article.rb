class Article < ApplicationRecord
	validates :title, presence: true
	enum status: [ :unpublished, :published ]
end
																																																			