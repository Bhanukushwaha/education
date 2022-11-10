class ReviewsController < ApplicationController
	def like
		@review = Review.find(params[:likeable_id])
		@like = Like.create(:likeable_id => @review.id, likeable_type: "Review", :user_id=>current_user.id)
		@article = Article.find(@review.article_id)
   	redirect_to article_path(@article)
	end
	def dislike
		@review = Review.find(params[:likeable_id])
   	@like = Like.where(:likeable_id=> @review.id, likeable_type: "Review", :user_id=>current_user.id).first
   	@like = @like.destroy
   	@article = Article.find(@review.article_id)
   	redirect_to article_path(@article)
	end
end