# class ClickbaitValidator < ActiveModel::Validator
#
#   def validate(record)
#     if record.title
#       unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|word| record.title.include?(word)}
#         record.errors[:title] << "Your title is not clickbait!"
#       end
#     end
#   end
#
# end

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  # include ActiveModel::Validations
  # validates_with ClickbaitValidator
  validate :is_clickbait

  def is_clickbait
    if title
      if !["Won't Believe", "Secret", "Top", "Guess"].any? {|phrase| title.include?(phrase)}
      errors.add(:title, "not clickbait dummy!")
      end
    end
  end

end
