class CardMastersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @card_masters = CardMaster.paginate(page: params[:page])
  end

  def show
    @card_master = CardMaster.find(params[:id])
  end

  def new
    @card_master = CardMaster.new
  end

  def create
    @card_master = CardMaster.new(card_master_params)
    if @card_master.save
      flash[:success] = "Card Created!"
      redirect_to card_masters_path
    else
      render 'new'
    end
  end

  def update
    @card_master = CardMaster.find(params[:id])
    if @card_master.update_attributes(card_master_params)
      flash[:success] = "Question and answer updated"
      redirect_to card_masters_url
    else
      render 'edit'
    end
  end

  def destroy
    CardMaster.find(params[:id]).destroy
    flash[:success] = "Card deleted"
    redirect_to card_masters_url
  end

  private

    def card_master_params
      params.require(:card_master).permit(:question, :answer)
    end

    # before action

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end