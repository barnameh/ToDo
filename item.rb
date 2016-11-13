require_relative "list"

class Item < ActiveRecord::Base
  belongs_to :list
  validates :name, :list_id, presence: true
end
