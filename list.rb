require_relative "user"

class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :name, :user_id, presence: true
end
