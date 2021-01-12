class PrototypesController < ApplicationController
  #ログインしていないユーザーはログイン画面に遷移させる
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_prototype, only: [:edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params_update)
      #   数字を送ってるだけ
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    @prototype.destroy
    redirect_to root_path(@prototype.id)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def prototype_params_update
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
    #ログインしてないとトップページに戻る
  def set_prototype
    #binding.pry
    @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
        redirect_to action: :index
    end
  end
end
