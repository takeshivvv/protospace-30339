class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show, :update, :destroy]

  def index
    @prototypes = Prototype.all
end

  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(prototypes_params)
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


end