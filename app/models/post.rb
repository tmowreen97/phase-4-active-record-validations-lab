class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :no_true_facts

  def no_true_facts
    if title=='True Facts'
      errors.add(:title, "True Facts can not be the title!")
    end
  end
end
