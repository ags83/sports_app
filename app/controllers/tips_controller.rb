class TipsController < ApplicationController
  before_filter :require_user
  # GET /tips
  # GET /tips.json
  def index
	@comp = Comp.first(:order => "id DESC", :conditions => [ "status = ?", 0 ])
	user = User.find(@user_id)
	if @comp
		@tips = Tip.where(:user_id => @user_id, :comp_id => @comp.id)
		if @tips 
			respond_to do |format|
				format.html # new.html.erb
				format.json { render json: @tip }
			end
		end
	end
   end

  # GET /tips/1
  # GET /tips/1.json
  def show
  
  @comp = Comp.first(:order => "id DESC", :conditions => [ "status = ?", 0 ])
  user = User.find(@user_id)
  
	
	if @comp
		@games = Game.find_all_by_comp_id(@comp.id)
		if @games 
			@tips = Tip.where(:user_id => @user_id, :comp_id => @comp.id)
			Person.where(:user_name => user_name, :password => password)
			respond_to do |format|
				format.html # new.html.erb
				format.json { render json: @tip }
			end
		end
	end
	
	
	

  end
  
  def mytips
    comp = Comp.first(:order => "id DESC", :conditions => [ "status = ?", 0 ])
	user = User.find(@user_id)
	if comp 
		if user.comp_id != comp.id
			redirect_to new_tip_path
		else
			redirect_to tips_path
		end
	end
  end
	

  # GET /tips/new
  # GET /tips/new.json
  def new
	@comp = Comp.first(:order => "id DESC", :conditions => [ "status = ?", 0 ])
	user = User.find(@user_id)
	if @comp
		@games = Game.find_all_by_comp_id(@comp.id)
		if @games 
			respond_to do |format|
				format.html # new.html.erb
				format.json { render json: @tip }
			end
		end	
	end
  end

  # GET /tips/1/edit
  def edit
	@comp = Comp.first(:order => "id DESC", :conditions => [ "status = ?", 0 ])
	user = User.find(@user_id)
	
	
	if @comp
		@games = Game.find_all_by_comp_id(@comp.id)
		if @games 
			respond_to do |format|
				format.html # new.html.erb
				format.json { render json: @tip }
			end
		end
	end
  end

  # POST /tips
  # POST /tips.json
  def create
	comp_id = params[:comp_id]
	params['game'][0].each do |key, value|
		tip = Tip.new
		tip.team_id = value
		tip.game_id = key
		tip.user_id = @user_id
		tip.comp_id = comp_id
		tip.save
	end
	
	user = User.find(@user_id)
	user.comp_id = comp_id
	if user.save
		respond_to do |format|
		format.html { redirect_to tips_url, notice: 'Tip was successfully created.' }
		format.json { render json: tip, status: :created, location: tip }
		end
	else
		respond_to do |format|
		format.html { redirect_to tips_url, notice: 'Error saving tips.' }
		end
	end
  end

  # PUT /tips/1
  # PUT /tips/1.json
  def update
    
	@tip = Tip.find(params[:id])

    respond_to do |format|
      if @tip.update_attributes(params[:tip])
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip = Tip.find(params[:id])
    @tip.destroy

    respond_to do |format|
      format.html { redirect_to tips_url }
      format.json { head :no_content }
    end
  end
  
  private
  
	def require_user
		if session[:user_id] == nil
			redirect_to root_url, :notice => "You must log in !"
		else
			@user_id = session[:user_id]
		end
	end

end
