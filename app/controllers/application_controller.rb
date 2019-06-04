class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Layout
  layout :layout_by_resource

  #Pundit
  include Pundit
  #Trabalha com erro no Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não está autorizado para esta ação."
    redirect_to(request.referrer || root_path)
  end


  protected

  # Layout per resource_name com devise
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "backoffice_devise"
    else
      "application"
    end
  end
end
