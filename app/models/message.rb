class Message < ApplicationRecord
  belongs_to :user
  
  # imageカラムが空の場合、contentカラムも空であれば保存しない
  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
