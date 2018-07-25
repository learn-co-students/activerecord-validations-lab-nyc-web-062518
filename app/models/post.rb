class Post < ActiveRecord::Base
  validates(:title, presence: true)

  validates(:content, length: {minimum: 250})

  validates(:summary, length: {maximum: 250})

  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :is_clickbait

  def is_clickbait
    if title
      if !["Won't Believe", "Secret", "Top [number]",  "Guess"].any? {|bait| title.include?(bait)}
        errors.add(:title, "this aint no clickbait")
      end
    end
  end
end
