class Image < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { show: '300x300#', medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
