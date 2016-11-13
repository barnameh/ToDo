require_relative "list"

class Item < ActiveRecord::Base
  belongs_to :list
  validates :name, presence: true
end
