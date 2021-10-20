require "test_helper"

class PostTest < ActiveSupport::TestCase

	test "title presence" do
		post = Post.new
		assert_not post.Title

		post.Title = "My title"
		assert post.Title
	end

	test "content presence" do
		post = Post.new(Title: "Great Post")
		assert_not post.content

		post.content = "My fancy content"
		assert post.content
	end
    
    test "image presence" do
		post = Post.new(Title: "Great Post",content: "My fancy content")
		assert_not post.image_data

		post.image = "image.jpg"
		assert post.image_data
	end

	test "categories relation" do
		category = categories(:category1)
		# Base on fixture data
		assert_equal 1, post.comments.count

		# New post
		post = Post.new(Title: 'My title',content: "My content", image_data:"image1",category_id: category.id)
		assert post.save

		category.reload

		assert_equal 2, category.title.count
	end
end
