class Link < ApplicationRecord
  validates :destination, presence: true,
                          format: { with: URI.regexp }
end
