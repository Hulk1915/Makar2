class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  has_one_attached :image_url

  validate :image_type

  private

  def image_type
    if image_url.attached? && !image_url.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image_url, 'должен быть в формате JPEG или PNG')
    end
  end
end
