class LessonsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def index
    @card_categories = CardCategory.paginate(page: params[:page])
  end

  def show
    @category_id = params[:category_id]
    @category = CardCategory.find(@category_id).category

    @lessons = CardTmp.where(create_user: current_user.id)
                      .paginate(page: params[:page])

    if @lessons.empty?
      @card_masters = CardMaster.where(category_id: @category_id)
      @card_masters.each do |card_master|
        lesson = CardTmp.new
        lesson.category_id = @category_id
        lesson.card_master_id = card_master.id
        lesson.question = card_master.question
        lesson.answer = card_master.answer
        lesson.choice1 = card_master.choice1
        lesson.choice2 = card_master.choice2
        lesson.choice3 = card_master.choice3
        lesson.choice4 = card_master.choice4
        lesson.create_user = current_user.id
        lesson.rank = 1
        lesson.next_time = Time.zone.now
        lesson.save
      end
      @lessons = CardTmp.where(create_user: current_user.id)
                        .paginate(page: params[:page])
    end

    def update
      @card_tmp = CardTmp.find_by(id: params[:lesson_id])
      if @card_tmp.rank == 1
        rank = 2
      else
        rank = 1
      end
      @card_tmp.update_attribute(:rank, rank)
      respond_to do |format|
        format.html {
          redirect_to '/lessons/category/'+@card_tmp.category_id.to_s
        }
        format.js
      end
    end
  end

  private

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