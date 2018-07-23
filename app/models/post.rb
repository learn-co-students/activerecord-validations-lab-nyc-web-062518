class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :click_bait_title

  def click_bait_title
    click_bait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
    if click_bait.none? {|pat| pat.match title}
    # click_bait.each do |c|
    #   if title.include?(c) == false
        errors.add(:title, "must be clickbait")
    #   end
    end
  end

end
