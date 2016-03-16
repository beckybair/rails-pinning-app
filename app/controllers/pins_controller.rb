# Pins Controller Class
class PinsController < ApplicationController
  before_action :require_login, except: [:index, :show, :show_by_name]

  def index
    @pins = Pin.find_by_user_id(current_user.id)
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def show_by_name
    #search for a Pin using the slug you grab from the URL
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.create(pin_params)
    if @pin.save
      redirect_to pin_path(@pin)
    else
      @errors = @pin.errors.full_messages
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

  private

  def pin_params
    params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
  end

end
