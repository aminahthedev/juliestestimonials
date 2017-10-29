class Comment < ActiveRecord::Base
  belongs_to :commenter, foreign_key: :commenter_id, class_name: :User
  belongs_to :testimonial
end
