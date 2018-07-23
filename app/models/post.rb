class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validate :category, inclusion: { is: ('Fiction' || 'Non-Fiction'}
  validate :title_is_clickbaity

  # def category_within_options
  #     if !(category == 'Fiction' || category == 'Non-Fiction')
  #       errors.add(:category, "has to be either 'Fiction' or Non-Fiction'")
  #     end
  # end

  def title_is_clickbaity
    clickbaits = ["Won't Believe", "Secret", "Top", "Guess"]
    if !(clickbaits.any? { |cb| title && title.include?(cb) })
      errors.add(:title, "not clickbait-y enough")
    end
  end

end
