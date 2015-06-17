class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :tag_cloud
  before_action :search_term




  rescue_from CanCan::AccessDenied, with: :not_authorized

  private

  def not_authorized
    redirect_to "error#not_found", :alert => "Nieautoryzowany dostęp"

  end

  def search_term
    @search_term ||= {}
  end

  def page_not_found
    respond_to do |format|
      format.html { render template: 'public/404', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end
  def tag_cloud

    @tags = Attraction.tag_counts_on(:tags).order('count desc').limit(5)
  end

  def index
    @attractions = ActsAsTaggableOn::Attraction.all
    #ActsAsTaggableOn::Tag.most_used(10)
  end

  def cat
    @categories = Category.all
  end

end
