class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @songs = Song.tagged_with(@tag.name)
  end

  def index
      # @tags = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
      @tags = ActsAsTaggableOn::Tag.most_used
  end

end
