# Pins Controller Class
class PinsController < ApplicationController
  before_action :require_login, except: [:index, :show, :show_by_name]

  def index
    @pins = Pin.all
  end

  def show
    @pin = Pin.find(params[:id])
    @users = @pin.users
  end

  def show_by_name
    #search for a Pin using the slug you grab from the URL
    @pin = Pin.find_by_slug(params[:slug])
    @users = @pin.users
    render :show
  end

  def new
    @pin = Pin.new
	   #@pinnable_boards = current_user.pinnable_boards
  end

  def create
    @pin = Pin.create(pin_params)
    if @pin.valid?
  		@pin.save
  		if params[:pin][:pinning][:board_id] # check if a board is selected
  			board = Board.find(params[:pin][:pinning][:board_id]) # find the selected board in the db
  			@pin.pinnings.create!(user: current_user, board: board) # create a new pinning with the user and board as params
        # and let the rails associations take care of the ids
  		end
  		redirect_to pin_path(@pin)
  	else
  		@errors = @pin.errors
  	  render :new
    end
  end

  def edit
    @pin = Pin.find(params[:id])
    render :edit
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors.full_messages
      render :edit
    end
  end

  def repin
    @pin = Pin.find(params[:id])
    @pin.pinnings.create(user: current_user)
    @pinning = @pin.pinnings.where("user_id=?", current_user)
    redirect_to user_path(current_user)
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
  end

end
