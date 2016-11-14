require_relative "list"

class Item < ActiveRecord::Base
  belongs_to :list
  validates :name, :list_id, presence: true

  def complete?
    self.complete
  end
end
