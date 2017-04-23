class Image < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { show: '300x300#' },
    default_url: "missing.png"
  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage\/.*\z/ }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  process_in_background :image

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
