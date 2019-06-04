class Backoffice_controller < ApplicationController
  before_action :authenticate_admin!
  layout "backoffice"

  #Usuário atual para ser utilizado no Pundit
  def pundit_user
    current_admin
  end
end