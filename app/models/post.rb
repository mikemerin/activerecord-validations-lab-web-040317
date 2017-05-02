class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { :minimum => 250 }
  validates :summary, length: { :maximum => 250 }
  validates :category, inclusion: { in: ["Fiction","Non-Fiction"] }
  validate :clickbait

  @@clickbait = ["Won't Believe", "Secret", "Top" "Guess"]

  def clickbait
    if @@clickbait.none? { |cb| /#{cb}/.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
