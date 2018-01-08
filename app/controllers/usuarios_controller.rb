class UsuariosController < ApplicationController
  before_action :set_user
  # Actualizar solo si el usuario este logueado
  before_action :authenticate_user!, only: [:update]
  # Actualizar solo si el usuario es el dueño de esta cuenta
  before_action :authenticate_owner!, only: [:update]

  def show

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{redirect_to @user}
      else
        format.html{redirect_to @user, notice: "Error al actualizar"}
      end
    end

  end
  private
    def set_user
      @user = User.find(params[:id])
    end

    def authenticate_owner!
      if current_user != @user
        redirect_to root_path, notice: "No estás autorizado", status: :unauthorized
      end
    end

    def user_params
      params.require(:user).permit(:email,:last_name,:username,:name,:email,:bio,:avatar,:cover)
    end
end
