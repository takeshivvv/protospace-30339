class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]


  def index
    @prototypes = Prototype.includes(:user)
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

  def update
    if @prototype.update(prototypes_params)
       redirect_to prototype_path
    else
       render :edit
    end
  end

  def edit
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


private
  def prototypes_params
    params.require(:prototype).permit(:title, :concept, :catch_copy, :image ).merge(user_id: current_user.id)
  end 

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end


end