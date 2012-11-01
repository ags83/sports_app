class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to tips_path, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def leaderboard
    @users = User.order("score DESC")
	@comp = Comp.first(:order => "id DESC", :conditions => [ "status = ?", 2 ])
	@compscores = UserComp.find_all_by_comp_id(@comp.id)
	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  
end
