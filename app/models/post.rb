class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait

  def clickbait
    bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if bait.none? { |b| title&.include?(b) }
      errors.add(:title, "Not clickbait")
    end
  end
end
