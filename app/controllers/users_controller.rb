class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authorize

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'Something happened' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user = User.find_by(id: user_update_params[:id])

    if !user
      raise StandardError.new "No such user found!"
    end

    old_pass = user_update_params[:old_password]

    respond_to do |format|
      unless user.authenticate(old_pass)
        format.html { redirect_to edit_user_path(@user), notice: "Old pass is not legit!" }
        format.json { render :show, status: :ok, location: @user }
      end

      if @user.update({ name: user.name, password: user_update_params[:password] })
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, notice: 'Ugh oh!' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    name = @user.name
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User #{name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  rescue_from 'User::StandardError' do |exception|
    redirect_to users_url, notice: exception.message || 'Cannot delete the last user!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user)
        .permit(:name, :password, :password_confirmation)
    end

    def user_update_params
      puts "params"
      puts params
      params.require(:user)
        .permit(:id, :password, :old_password)
    end
end
