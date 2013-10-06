class BurnersController < ApplicationController
  before_action :login_required
  before_action :load_burners,    :only => [:index]
  before_action :load_burner,     :only => [:show, :edit, :update, :destroy]
  before_action :load_new_burner, :only => [:new, :create]

  def create
    if @burner.save
      redirect_to burner_url(@burner), :notice => t('c.burners.create.success')
    else
      flash[:error] = t('c.burners.create.error')
      render :new
    end
  end

  def update
    if @burner.update_attributes(filtered_params)
      redirect_to burner_url(@burner), :notice => t('c.burners.update.success')
    else
      flash[:error] = t('c.burners.update.error')
      render :show
    end
  end

  def destroy
    if @burner.destroy
      redirect_to burners_url, :notice => t('c.burners.destroy.success')
    else
      flash[:error] = t('c.burners.destroy.error')
      render :show
    end
  end

  private

  def load_burners
    @burners = user_scoped_burners.to_a
  end

  def load_burner
    @burner = user_scoped_burners.find(params[:id])
  end

  def load_new_burner
    @burner = user_scoped_burners.new
  end

  def user_scoped_burners
    current_user.burners
  end

  def filtered_params
    params.require(:burner).permit([:email_address_id])
  end
end