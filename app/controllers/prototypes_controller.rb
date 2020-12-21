class PrototypesController < ApplicationController


  def index
end


private
  def prototypes_params
    params.require(:users).permit(:name, :email ).merge(user_id: current_user.id)
  end 


end