class Link < ApplicationRecord
  validates :destination, presence: true,
                          format: { with: URI.regexp }
  validates :title, presence: true
end
