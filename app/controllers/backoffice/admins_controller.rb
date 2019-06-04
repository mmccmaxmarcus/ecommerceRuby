class Backoffice::AdminsController < Backoffice_controller

  before_action :set_admin, only: [:update, :edit, :destroy]
  after_action :verify_authorized, only: :new
  after_action :verify_policy_scoped, only: :index

  def index
    # @admins = Admin.all
    #@admins = Admin.where(role: 'full_access')
    #@admins = Admin.where(role: 'restrict_access')
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "Salvo administrador com email #{@admin.email}"
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now

      redirect_to backoffice_admins_path, notice: "Editado administrador com email #{@admin.email}"
    else
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O administrador #{@admin.email} foi removido com sucesso"
    else
      render :index
    end
  end

  private

  def params_admin
    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]
    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end
    params.require(:admin).permit(policy(@admin).permitted_attributes)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
