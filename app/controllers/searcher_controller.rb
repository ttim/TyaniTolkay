class SearcherController < ApplicationController
  def main
    @query = ""
  end

  def search
    @query = params[:q] || ""
    redirect_to main_path if @query == ""

    @ads = Ad.where("UPPER(tags_for_search) LIKE UPPER(?)", "%"+@query.split(",").map { |x| x.strip.upcase }.sort.join("%")+"%")
  end

end
