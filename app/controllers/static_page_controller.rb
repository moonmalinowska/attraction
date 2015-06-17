class StaticPageController < ApplicationController
  skip_authorization_check

  def home
    @categories= Category.all
  end

  def trips
    @variety = Variety.find_by_id(1)

    @attractions=Attraction.all
    @varieties=Variety.all

    @categories= Category.all

  end

  def fairs
    @variety = Variety.find_by_id(3)
    @categories= Category.all
    @attractions=Attraction.all
  end

  def museums
    @variety = Variety.find_by_id(2)
    @categories= Category.all
    @attractions=Attraction.all
  end


  def tips
    @categories= Category.all
    @attractions=Attraction.all
  end

  def search_query(results = nil)
    @categories= Category.all
    @results = results
    @tags = Attraction.tag_counts_on(:tags).order('count desc').limit(5)
    @_response = ActionDispatch::Response.new
  end

  def search
    @categories = Category.all
  end

end
