class UsersController < ApplicationController
  before_filter :require_no_authentication, :only => [:new, :create]
  before_filter :can_change, :only => [:show, :edit, :update, :index]

  def new
    @user = User.new
  end

  def index
    redirect_to root_path()
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      SignupMailer.confirm_email(@user).deliver
      redirect_to @user, :notice => 'Cadastro criado com sucesso!'
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    redirect_to root_path()
  end

  def update
    redirect_to root_path()
  end

  private

  def can_change
    unless user_signed_in?
      redirect_to root_path()
    end
  end
end