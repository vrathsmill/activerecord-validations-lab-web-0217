class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {:minimum => 250 }
  validates :summary, length: {:maximum => 250 }
  validates :category, inclusion: %w(Fiction Non-Fiction)
  validate :clickbait 




   	def clickbait
   		click_bait = ["Won't Believe", "Secret", "Top", "Guess"]
   		click_bait.each do |clickbait|
   			if title.present? && !title.include?(clickbait)
   				errors.add(:title, "Halt")
   				return false
   			else
   				return true
   			end
   		end
   	end





end
