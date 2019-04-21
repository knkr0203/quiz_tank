class CardCategoriesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @card_categories = CardCategory.paginate(page: params[:page])
  end

  def new
    @card_category = CardCategory.new
  end

  def create
    @card_category = CardCategory.new(card_category_params)
    if @card_category.save
      flash[:success] = "Card Created!"
      redirect_to card_categories_path
    else
      render 'new'
    end
  end

  def edit
    @card_category = CardCategory.find(params[:id])
  end

  def update
    @card_category = CardCategory.find(params[:id])
    if @card_category.update_attributes(card_category_params)
      flash[:success] = "Question and answer updated"
      redirect_to card_categories_url
    else
      render 'edit'
    end
  end

  def destroy
    CardCategory.find(params[:id]).destroy
    flash[:success] = "Card deleted"
    redirect_to card_categories_url
  end

  private

    def card_category_params
      params.require(:card_category).permit(:category)
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