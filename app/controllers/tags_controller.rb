class TagsController < ApplicationController
	def create
		@picture = Picture.find(params[:id])
		@tag = @picture.tags.create(params[:tag])
		redirect_to post_path(@picture)
	end
end
