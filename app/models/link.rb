class Link < ApplicationRecord
  validates :destination, presence: true,
                          format: { with: URI.regexp }
  validates :title, presence: true

  belongs_to :user
  has_many :votes, dependent: :destroy
end
