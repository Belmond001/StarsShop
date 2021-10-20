require "test_helper"

class UserTest < ActiveSupport::TestCase

  NAMES = ["kamdem", "simo"]
  EMAILS = ["MyEmail@gmail.com", "another@gmail.com"]
  PASSWORD = "password"
  NAME = NAMES[0]
  EMAIL = EMAILS[0]
  EMAIL_FORMAT = /\w+@w+/

  test "email presence" do 
    u = User.new
    assert_not u.email

    u.email = EMAIL
    assert u.email
  end

  test "name presence" do 
    u = User.new
    assert_not u.name

    u.name = NAME
    assert u.name
  end

  test "email uniqueness" do 
    u1 = User.create(email: EMAIL, name: NAME, password: PASSWORD)
    assert u1.persisted?

    u2 = User.create(email: EMAIL, name: NAME, password: PASSWORD)
    assert u2.new_record?

    assert u1.id
    assert_not u2.id
  end

  test "name_uniqueness" do 
    u1 = User.create(name: NAME, email: EMAILS[0], password: PASSWORD)
    assert u1.persisted?

    u2 = User.create(name: NAME, email: EMAILS[1], password: PASSWORD)
    assert u2.new_record?

    assert u1.id
    assert_not u2.id
  end

  test "email valid format" do
    u = User.new(email: 'my_email', name: NAME, password: PASSWORD)
    assert_not u.valid?

    u.email = EMAILS[1]
    assert u.valid?
  end

  

end
