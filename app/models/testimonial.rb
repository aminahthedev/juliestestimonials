class Testimonial < ActiveRecord::Base
  belongs_to :author_id, class_name: :User

  has_many :comments
end
