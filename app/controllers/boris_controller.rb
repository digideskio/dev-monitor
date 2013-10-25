class BorisController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  	@new_boris = Boris.new
  end

  def create
  	boris = Boris.new(params[:boris].permit(:name))
  	boris.save!
  end
end
