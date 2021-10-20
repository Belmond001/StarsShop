require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "comment presence" do
		comment = Comment.new
		assert_not comment.comment

		comment.comment="My comment Here"
		assert comment.comment
	end

  test "relation post" do
    post = posts(:post1)
		# Base on fixture data
		assert_equal 1, post.comments.count

		# New comment
		comment = Comment.new(comment: "My comment",post_id: post.id)
		assert commentt.save

		post.reload

		assert_equal 2, post.content.count
  
  end  
end
