require_relative "test_helper"

class UserTest < Minitest::Test
  def test_class_exists
    User
  end

  def test_can_create_user
    john = User.new(name: "John", email: "john@example1.com")
    assert john.save!
  end

  def test_name_is_required
    john = User.new(email: "john@example2.com")
    assert_raises { john.save! }
  end

  def test_email_is_required
    john = User.new(name: "John")
    assert_raises { john.save! }
  end

  def test_email_format
    john = User.new(name: "John", email: "john.example3.com")
    assert_raises { john.save! }
  end

  def test_email_uniqueness
    User.create!(name: "Johnny", email: "john@example4.com")
    john = User.new(name: "John", email: "john@example4.com")
    assert_raises { john.save! }
  end

  def test_can_get_associated_lists
    john = User.create!(name: "John", email: "john@example5.com")
    List.create!(name: "shopping", user_id: john.id)
    List.create!(name: "cleaning", user_id: john.id)
    assert_equal 2, john.lists.count
  end
end
