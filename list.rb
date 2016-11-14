require_relative "user"

class List < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :name, :user_id, presence: true

  def completed_items
    items.where(complete: true)
  end

  def incomplete_items
    items.where(complete: false) + items.where(complete: nil)
  end
end
