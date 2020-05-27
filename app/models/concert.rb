class Concert < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true

	scope :recent, -> { order(created_at: :desc) }
end
