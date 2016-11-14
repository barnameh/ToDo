require_relative "test_helper"

class ItemTest < Minitest::Test
  def test_class_exists
    Item
  end

  def test_can_creat_an_item
    john = User.create!(name: "John", email: "john@example.com")
    john_shopping = List.create!(name: "shopping", user_id: john.id)
    john_shopping_milk = Item.new(name: "milk", list_id: john_shopping.id)
    assert john_shopping_milk.save!
  end

  def test_item_name_required
    john = User.create!(name: "John", email: "john@example2.com")
    john_shopping = List.create!(name: "shopping", user_id: john.id)
    john_shopping_item = Item.new(list_id: john_shopping.id)
    assert_raises { john_shopping_item.save! }
  end

  def test_cannot_save_orphan_item
    milk = Item.new(name: "milk")
    assert_raises { milk.save! }
  end
end
