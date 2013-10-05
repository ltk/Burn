class AccountsController < User::Controller
  before_action :login_required,          :only => [:show, :udpate]
  before_action :redirect_logged_in_user, :only => [:new, :create]
  before_action :load_user,               :only => [:show, :update]
  before_action :load_new_user,           :only => [:new,  :create]

  def create
    if @user.update_attributes(filtered_params)
      self.current_user = @user
      redirect_to account_url, :notice => t('c.users.create.success')
    else
      flash[:error] = t('users.create.error')
      render :new
    end
  end

  def update
    if @user.update_attributes(filtered_params)
      redirect_to root_url, :notice => t('c.users.update.success')
    else
      flash[:error] = t('c.users.update.error')
      render :show
    end
  end

  private

  def load_user
    @user = current_user
  end

  def load_new_user
    @user = User.new
  end

  def filtered_params
    params.require(:user).permit([:account_email, :password, :password_confirmation])
  end
end