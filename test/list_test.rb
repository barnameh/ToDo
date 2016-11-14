require_relative "test_helper"

class ListTest < Minitest::Test
  def test_class_exists
    List
  end

  def test_can_creat_list
    john = User.create!(name: "John", email: "john@example.com")
    john_shopping = List.new(name: "shopping", user_id: john.id)
    assert john_shopping.save!
  end

  def test_list_name_required
    john = User.create!(name: "John", email: "john@example2.com")
    john_shopping = List.new(user_id: john.id)
    assert_raises { john_shopping.save! }
  end

  def test_cannot_save_orphan_list
    shopping = List.new(name: "shopping")
    assert_raises { shopping.save! }
  end

  def test_can_get_a_lists_associated_items
    john = User.create!(name: "John", email: "john@example5.com")
    john_shopping = List.create!(name: "shopping", user_id: john.id)
    Item.create!(name: "milk", list_id: john_shopping.id)
    Item.create!(name: "eggs", list_id: john_shopping.id)
    Item.create!(name: "olive oi", list_id: john_shopping.id)
    assert_equal 3, john_shopping.items.count
  end

  def test_can_get_list_of_completed_items
    john = User.create!(name: "John", email: "john@example6.com")
    john_shopping = List.create!(name: "shopping", user_id: john.id)
    milk = Item.create!(name: "milk", list_id: john_shopping.id)
    eggs = Item.create!(name: "eggs", list_id: john_shopping.id)
    Item.create!(name: "olive oi", list_id: john_shopping.id)
    milk.complete = true
    milk.save!
    eggs.complete = true
    eggs.save!
    assert_equal 2, john_shopping.completed_items.count
  end

  def test_can_get_list_of_incomplete_items
    john = User.create!(name: "John", email: "john@example7.com")
    john_shopping = List.create!(name: "shopping", user_id: john.id)
    milk = Item.create!(name: "milk", list_id: john_shopping.id)
    eggs = Item.create!(name: "eggs", list_id: john_shopping.id)
    Item.create!(name: "olive oi", list_id: john_shopping.id)
    milk.complete = true
    milk.save!
    eggs.complete = false
    eggs.save!
    assert_equal 2, john_shopping.incomplete_items.count
  end
end
