class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @songs = Song.tagged_with(@tag.name)
  end
end
