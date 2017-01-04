class Topic < ActiveRecord::Base
  has_many :questions
  has_many :user_topics
  has_many :users, through: :user_topics
end
