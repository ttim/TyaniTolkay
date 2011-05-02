class SearcherController < ApplicationController
  def main
    @query = ""
    @price_to = ""

    tags = Hash.new
    Ad.all.each do |ad|
      ad_tags = ad.tags.split(",").map { |x| x.strip }
      ad_tags.each do |tag|
        tags[tag] = tags[tag] == nil ? 1 : tags[tag] + 1
      end
    end

    tags_array = Array.new
    tags.each do |key, value|
      tags_array.push({:tag => key, :count => value})
    end

    min_coeff = 1
    max_coeff = 3
    coeff_diff = max_coeff - min_coeff

    min_count = tags_array.min_by { |tag| tag[:count] }[:count]
    max_count = tags_array.max_by { |tag| tag[:count] }[:count]
    count_diff = max_count - min_count

    multiplier = Float(coeff_diff) / count_diff

    tags_array.each do |tag|
      tag[:coeff] = min_coeff + (tag[:count] - min_count) * multiplier
    end

    @tags_to_cloud = tags_array.randomly_pick(30)
  end

  def search
    @query = params[:q] || ""
    redirect_to main_path if @query == ""

    @price_to = params[:price_to]

    price_to = is_num?(@price_to) ? Integer(@price_to) : nil

    if price_to != nil then
      @ads = Ad.
          where("UPPER(tags_for_search) LIKE UPPER(?)", "%"+@query.split(%r{[, ]}).map { |x| x.strip }.sort.join("%")+"%").
          where("price <= ?", price_to)
    else
      @ads = Ad.
          where("UPPER(tags_for_search) LIKE UPPER(?)", "%"+@query.split(%r{[, ]}).map { |x| x.strip }.sort.join("%")+"%")
    end
  end

end
