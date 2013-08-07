class ProfilesController < ApplicationController
  before_filter :require_authentication

  def show
    @user = current_user
  end

  def update
  	@user = current_user
    if @user.update_attributes(params[:user])
      redirect_to profile_path, :notice => 'Cadastro atualizado com sucesso!'
    else
      render :show
    end
  end
end