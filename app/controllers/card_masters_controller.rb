class CardMastersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @category_id = params[:category_id]
    @category = CardCategory.find(@category_id).category
    @card_masters = CardMaster.where(category_id: @category_id).paginate(page: params[:page])
  end

  def new
    @card_master = CardMaster.new
    @category_id = params[:category_id]
  end

  def create
    @card_master = CardMaster.new(card_master_params)
    @card_master.category_id = params[:category_id]
    if @card_master.save
      flash[:success] = "Card Created!"
      redirect_to card_masters_path+'/category/'+@card_master.category_id.to_s
    else
      render 'new'
    end
  end

  def edit
    @card_master = CardMaster.find(params[:id])
  end

  def update
    @card_master = CardMaster.find(params[:id])
    if @card_master.update_attributes(card_master_params)
      flash[:success] = "Question and answer updated"
      redirect_to card_masters_url+'/category/'+@card_master.category_id.to_s
    else
      render 'edit'
    end
  end

  def destroy
    delete_card = CardMaster.find(params[:id])
    delete_card.destroy
    flash[:success] = "Card deleted"
    redirect_to card_masters_url+'/category/'+delete_card.category_id.to_s
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