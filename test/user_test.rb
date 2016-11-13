require_relative "test_helper"

class UserTest < Minitest::Test
  def test_class_exists
    User
  end

  def test_create_user
    john = User.new(name: "John", email: "john@example.com")
    assert john.save!
  end

  def test_name_is_required
    john = User.new(email: "john@example.com")
    assert_raises { john.save! }
  end

  def test_email_is_required
    john = User.new(name: "John")
    assert_raises { john.save! }
  end

  def test_email_format
    john = User.new(name: "John", email: "john.example.com")
    assert_raises { john.save! }
  end
end
