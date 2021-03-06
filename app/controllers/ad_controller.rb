class AdController < ApplicationController
  def view
    @ad = Ad.find_by_id(params[:id])
  end

  def edit
    @ad = Ad.find_by_id(params[:id])
    @action = :edit
  end

  def save
    if (user_signed_in?)
      ad = Ad.find_by_id(params[:ad][:id])
      if (ad == nil) then
        ad = Ad.new(params[:ad])
        ad.user = current_user
      else
        ad.update_attributes!(params[:ad])
      end

      ad.save!
      redirect_to view_ad_path(ad.id)
    end
  end

  def remove
    ad = Ad.find_by_id(params[:id])
    ad.delete if current_user.can_remove_ad?(ad)
    redirect_to :back
  end

  def new
    @ad = Ad.new
    @action = :new
    render 'ad/edit'
  end
end
