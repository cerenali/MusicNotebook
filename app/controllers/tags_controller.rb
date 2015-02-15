class TagsController < ApplicationController
 def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def index
    @tags = Tag.all
  end

  private

  def tag_params
    params.require(:tag).permit(:title, :count)
  end
end
