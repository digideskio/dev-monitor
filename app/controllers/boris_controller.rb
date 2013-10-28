class BorisController < ApplicationController
  protect_from_forgery with: :exception

  def index
  	@new_boris = Boris.new
  end

  def create
  	boris = Boris.new(params[:boris].permit(:name, :command_start))
  	boris.save!
  	redirect_to "/"
  end

  def start
    boris = Boris.find_by_name(params[:name])
    boris.start

    head :no_content
  end

  def stop
    boris = Boris.find_by_name(params[:name])
    boris.stop

    head :no_content
  end
end
