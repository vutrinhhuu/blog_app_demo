class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validate :picture_size

  private
  def picture_size
    return unless picture.size > Settings.file_limit_size.megabytes
    errors.add :picture, t("pic_size_warning")
  end
end
