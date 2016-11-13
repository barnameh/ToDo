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
end
