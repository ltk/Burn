class EmailAddressesController < ApplicationController
  before_action :login_required
  before_action :load_emails,    :only => [:index]
  before_action :load_email,     :only => [:show, :edit, :update, :destroy]
  before_action :load_new_email, :only => [:new, :create]

  def create
    if @email.update_attributes(filtered_params)
      redirect_to email_address_url(@email), :notice => t('c.email_addresses.create.success')
    else
      flash[:error] = t('c.email_addresses.create.error')
      render :new
    end
  end

  def update
    if @email.update_attributes(filtered_params)
      redirect_to email_address_url(@email), :notice => t('c.email_addresses.update.success')
    else
      flash[:error] = t('c.email_addresses.update.error')
      render :show
    end
  end

  def destroy
    if @email.destroy
      redirect_to emails_url, :notice => t('c.email_addresses.destroy.success')
    else
      flash[:error] = t('c.email_addresses.destroy.error')
      render :show
    end
  end

  private

  def load_emails
    @emails = user_scoped_emails.to_a
  end

  def load_email
    @email = user_scoped_emails.find(params[:id])
  end

  def load_new_email
    @email = user_scoped_emails.new
  end

  def user_scoped_emails
    current_user.email_addresses
  end

  def filtered_params
    params.require(:email_address).permit([:address])
  end
end