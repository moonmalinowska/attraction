class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @games = Attraction.tagged_with(@tag.name)
  end
end
