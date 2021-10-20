require "test_helper"
class CategoryTest < ActiveSupport::TestCase
    test "title presence" do
       c= Category.new
       assert_not c.valid?
       c.title=' '
       assert_not c.valid?
       c.title='Category Title T-shirt '
       assert c.valid?
       assert c.save

    end
    test "title uniqueness" do
        c1= Category.create(title:'Cap')
        assert c.persisted?
        c2= Category.create(title:"Bag")
        assert c2.new_record?
        c3= Category.create(title:'Pant')
        assert c3.persisted?
        assert c3.id 
        assert_not c2.id
    end 
     
end        