class SearchController < ApplicationController
  def search
    setup_variables
    @results = []
    [Region, Attraction, Category].each do |obj|
      @results << obj.search(@search_term)
    end
    calculate_results
    sp_controller = StaticPageController.new
    sp_controller.request = @_request
    sp_controller.search_query(@results)
    render 'static_page/search' and return
  end

  private

  def calculate_results
    @results.flatten!

    filtered_res = if @cat_id.present? && @region_id.present?
                     @results.select { |res| res.try(:category_id) == @cat_id.to_i && res.try(:region_id) == @region_id.to_i }
                   elsif @cat_id.present? ^ @region_id.present?
                     @results.select { |res| res.try(:category_id) == @cat_id.to_i || res.try(:region_id) == @region_id.to_i }
                   end

    @result = filtered_res if filtered_res.present?
    @result
  end

  def setup_variables
    @search_term = params[:q]
    @cat_id = params[:category_id]
    @region_id = params[:region_id]
    @categories = Category.all
  end

end
