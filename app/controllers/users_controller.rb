# :nodoc:
class UsersController < ApplicationController
  include ProviderContextRedirector

  skip_before_filter :is_logged_in, except: [:set_provider, :refresh_providers]
  skip_before_filter :setup_query

  def login
    session[:last_point] = request.referrer
    session[:last_point] = params[:next_point] if params[:next_point]

    redirect_to cmr_client.urs_login_path
  end

  def logout
    reset_session

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { render json: nil, status: :ok }
    end
  end

  def set_provider
    # Clear the currently set provider context token incase the call to create
    # the new one fails -- we don't want to leave the value set.
    session.delete(:echo_provider_token)

    provider_id = params[:provider_id] || params[:select_provider]

    current_user.update(provider_id: provider_id)

    set_provider_context_token

    respond_to do |format|
      format.html { redirect_to get_redirect_route(request.referer) }
      format.json { render json: nil, status: :ok }
    end
  end

  def refresh_providers
    current_user.update(provider_id: nil)
    current_user.set_available_providers(token)

    respond_to do |format|
      format.json { render json: { items: current_user.available_providers } }
    end
  end
end
