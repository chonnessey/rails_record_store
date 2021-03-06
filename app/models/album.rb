class Album < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_and_belongs_to_many :artists
  validates :name, presence: true
  validates_length_of :name, maximum: 100

  before_save(:titleize_album)

  private
    def titleize_album
      self.name = self.name.titleize
    end
end