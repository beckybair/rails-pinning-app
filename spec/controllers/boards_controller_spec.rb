require 'spec_helper'

RSpec.describe BoardsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
	  @board = @user.boards.first
    login(@user)
  end

  after(:each) do
    if !@user.destroyed?
      @user.pinnings.destroy_all
	    @user.boards.destroy_all
      @user.destroy
    end
  end

  # describe "GET index" do
	# it 'board pinner sees all pinnable boards' do
	# 	get :index
	# 	expect(assigns(:boards)).to eq(@user.pinnable_boards)
	# end
  #
  # end

  # describe "GET new" do
	# it 'responds with successfully' do
	# 	get :new
	# 	expect(response.success?).to be(true)
	# end
  #
	# it 'renders the new view' do
	# 	get :new
	# 	expect(response).to render_template(:new)
	# end
  #
	# it 'assigns an instance variable to a new board' do
	# 	get :new
	# 	expect(assigns(:board)).to be_a_new(Board)
	# end
  #
	# it 'redirects to the login page if user is not logged in' do
	# 	logout(@user)
	# 	get :new
	# 	expect(response).to redirect_to(:login)
	# end
  # end
  #
  # describe "POST create" do
	#   before(:each) do
	# 	@board_hash = {
	# 	  name: "My Pins!"
	# 	}
	#   end
  #
	#   after(:each) do
	# 	board = Board.find_by_name("My Pins!")
	# 	if !board.nil?
	# 	  board.destroy
	# 	end
	#   end
  #
	#   it 'responds with a redirect' do
	# 	post :create, board: @board_hash
	# 	expect(response.redirect?).to be(true)
	#   end
  #
	#   it 'creates a board' do
	# 	post :create, board: @board_hash
	# 	expect(Board.find_by_name("My Pins!").present?).to be(true)
	#   end
  #
	#   it 'redirects to the show view' do
	# 	post :create, board: @board_hash
	# 	expect(response).to redirect_to(board_url(assigns(:board)))
	#   end
  #
	#   it 'redisplays new form on error' do
	# 	# The name is required in the Board model, so we'll
	# 	# make the name nil to test what happens with
	# 	# invalid parameters
	# 	@board_hash[:name] = nil
	# 	post :create, board: @board_hash
	# 	expect(response).to render_template(:new)
	#   end
  #
	#   it 'redirects to the login page if user is not logged in' do
	# 	logout(@user)
	# 	post :create, board: @board_hash
	# 	expect(response).to redirect_to(:login)
	#   end
	# end
  #
	# describe "GET #show" do
	#   it "assigns the requested board" do
	# 	get :show, {:id => @board.to_param}
	# 	expect(assigns(:board)).to eq(@board)
	#   end
  #
	#   it "assigns the @pins variable with the board's pins" do
	# 	get :show, {:id => @board.to_param}
	# 	expect(assigns(:pin)).to eq(@pin)
	#   end
	# end

	# describe "GET edit" do
	# 	it 'responds successfully' do
	# 		get :edit, {:id => @board.to_param}
	# 		expect(response.success?).to be(true)
	# 	end
	#
	# 	it 'renders the edit view' do
	# 		get :edit, {:id => @board.to_param}
	# 		expect(response).to render_template(:edit)
	# 	end
	#
	# 	it 'assigns an instance variable to a board' do
	# 		get :edit, {:id => @board.to_param}
	# 		expect(assigns(:board)).to eq(@board)
	# 	end
	#
	# 	it 'redirects to the login page if user is not logged in' do
	# 		logout(@user)
	# 		get :edit, {:id => @board.to_param}
	# 		expect(response).to redirect_to(:login)
	# 	end
	#
	# 	it 'sets @followers to the user\'s followers' do
	# 		get :edit, {:id => @board.to_param}
	# 		expect(assigns(:followers)).to eq(@user.user_followers)
	# 	end
	# end
	#
	# describe "PUT #update" do
	# 	before(:each) do
	# 	  @board_hash = {
	# 		name: @board.name
	# 	  }
	# 	end
	#
	# 	it 'responds with a redirect' do
	# 		put :update, id: @board.id, board: @board_hash
	# 		expect(response).to redirect_to(:board)
	# 	end
	#
	# 	it 'updates a board' do
	# 		@board_hash[:name] = "New Name"
	# 		put :update, id: @board.id, board: @board_hash
	# 		expect(@board.reload.name).to eq("New Name")
	# 	end
	#
	# 	it 'redirects to the show view' do
	# 		put :update, id: @board.id, board: @board_hash
	# 		expect(response).to redirect_to(board_url(assigns(:board)))
	# 	end
	#
	# 	it 'redisplays edit form on error' do
	# 		# The name is required in the Board model, so we'll
	# 		# set the name in the @board_hash to blank in order
	# 		# to test what happens with invalid parameters
	# 		@board_hash[:name] = ""
	# 		put :update, id: @board.id, board: @board_hash
	# 		expect(response).to render_template(:edit)
	# 	end
	#
	# 	it 'assigns the @errors instance variable on error' do
	# 		# The name is required in the Board model, so we'll
	# 		# set the name in the @board_hash to blank in order
	# 		# to test what happens with invalid parameters
	# 		@board_hash[:name] = ""
	# 		put :update, id: @board.id, board: @board_hash
	# 		expect(assigns[:board].errors.any?).to be(true)
	# 	end
	#
	# 	it 'redirects to the login page if user is not logged in' do
	# 		logout(@user)
	# 		put :update, id: @board.id, board: @board_hash
	# 		expect(response).to redirect_to(:login)
	# 	end
	#
	# 	it 'creates a BoardPinning' do
	# 		# This one is tricky, but see if you can understand what's going on
  #
	# 		# We get the user's first follower - this is the one we want to let pin on @board
	# 		user_to_let_pin = @user.followers.first
	# 		puts user_to_let_pin.inspect
	# 		puts "user_to_let_pin: #{user_to_let_pin.id}, board id: #{@board.id}"
	# 		# Now we're updating the hash we pass in to add
	# 		# board_pinners_attributes with our user_id
	# 		@board_hash[:board_pinners_attributes] = []
	# 		@board_hash[:board_pinners_attributes] << {user_id: user_to_let_pin.user_id, board_id: @board.id}
  #
	# 		put :update, id: @board.id, board: @board_hash
  #
	# 		# Then we expect this record to have been created
	# 		board_pinner = BoardPinner.where("user_id=? AND board_id=?", user_to_let_pin.user_id, @board.id)
	# 		puts BoardPinner.last.inspect
	# 		expect(board_pinner.present?).to be (true)
  #
	# 		# Let's clean up here
	# 		if board_pinner.present?
	# 		  board_pinner.destroy_all
	# 		end
	# 	end
	# end
end
