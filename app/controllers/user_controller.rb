class UserController < ApplicationController
  def view
    @user = User.find_by_id(params[:id])
    @ads = Ad.find_all_by_user_id(User.find_by_id(params[:id]))
  end

  def promote_action(new_role)
    user_to_promotion = User.find_by_id(params[:id])
    if current_user.can_promote?(user_to_promotion, new_role)
      user_to_promotion.role= new_role
      user_to_promotion.save!

      redirect_to view_user_path(user_to_promotion.id)
    end
  end

  def to_admin
    promote_action(:admin)
  end

  def to_moderator
    promote_action(:moderator)
  end

  def remove
    user = User.find_by_id(params[:id])
    if current_user.can_remove_user?(user)
      current_user.delete
      if (user.id == current_user.id)
        redirect_to main_path
      else
        redirect_to :back
      end
    end
  end

  def list
    @users = User.all
  end
end
