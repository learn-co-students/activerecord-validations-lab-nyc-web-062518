
class ClickbaitValidator < ActiveModel::Validator

  def validate(record)
    if record.title
      unless ["Won't Believe", "Secret", "Top", "Guess"].any? {|word| record.title.include?(word)}
        record.errors[:title] << "Your title is not clickbait!"
      end
    end
  end

end



class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  validates_with ClickbaitValidator

end
