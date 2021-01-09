class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]

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
    if current_user.update(prototypes_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end


private
  def prototypes_params
    params.require(:prototype).permit(:title, :concept, :catch_copy, :image ).merge(user_id: current_user.id)
  end 

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end


end