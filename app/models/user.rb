class User < ApplicationRecord
  has_secure_password

  has_one_attached :avatar

  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :albums, dependent: :destroy

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :name, presence: true, length: { in: 2..50 }
  validates :password, presence: true, length: { in: 8..48 }

  def admin?
    self.admin
  end

  def collect_albums
    albums.all.collect { |album| [ album.title, album.id ] }
  end
end