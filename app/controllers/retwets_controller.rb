class RetwetsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @retwet = current_user.retwets.create(retwet_params)
    if @retwet.valid? and @retwet.persisted?
      flash[:success] = "Retweted: #{@retwet.twet.content}"
    else
      flash[:error] = "We're sorry. You are unable to retwet that post."
    end
    smart_return
  end

  def destroy
    if resource.exists?
      resource.destroy_all
    else
      flash[:error] = "We're sorry. We could not find that retwet."
    end
    smart_return
  end

  private

  def resource
    @resource ||= current_user.retwets.where(:id => params[:id])
  end

  def retwet_params
    params.require(:retwet).permit(:twet_id)
  end

  def smart_return
    if params[:return_to].present?
      redirect_to params[:return_to]
    else
      redirect_to root_path
    end
  end
end