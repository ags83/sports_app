class CompsController < ApplicationController
  
 # http_basic_authenticate_with :name => "admin", :password => "password"
  
  # GET /comps
  # GET /comps.json
  def index
    @comps = Comp.order("id DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comps }
    end
  end

  # GET /comps/1
  # GET /comps/1.json
  def show
    @comp = Comp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comp }
    end
  end

  # GET /comps/new
  # GET /comps/new.json
  def new
    @comp = Comp.new
	@games = Game.find_all_by_comp_id(nil)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comp }
    end
  end

  # GET /comps/1/edit
  def edit
    @comp = Comp.find(params[:id])
	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comp }
    end
  end

  # POST /comps
  # POST /comps.json
  def create
  
    @comp = Comp.new(params[:comp])
	@games = Game.find_all_by_comp_id(nil)
	Comp.find_each(:status = 0)
    respond_to do |format|
      if @comp.save
		@games.each do |game|
			game.comp = @comp
			game.save
		end
		
        format.html { redirect_to @comp, notice: 'Comp was successfully created.' }
        format.json { render json: @comp, status: :created, location: @comp }
      else
        format.html { render action: "new" }
        format.json { render json: @comp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comps/1
  # PUT /comps/1.json
  def update
    @comp = Comp.find(params[:id])
	initial_status = @comp.status
    respond_to do |format|
      if @comp.update_attributes(params[:comp])
	    if @comp
			if initial_status == 0 and @comp.status == 2
				users = User.find_all_by_comp_id(@comp.id)
				users.each do |user|
					tips = Tip.find_all_by_user_id(user.id)
					counter = 0
					tips.each do |tip|
						if tip.team.id == tip.game.result
							counter += 1
						end
					end
					userComp = UserComp.new(:comp_id => @comp.id, :user_id => user.id, :score => counter)
					newScore = user.score + counter
					user.score = newScore
					user.save
				end
			end	
        format.html { redirect_to @comp, notice: 'Comp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comp.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # DELETE /comps/1
  # DELETE /comps/1.json
  def destroy
    @comp = Comp.find(params[:id])
    @comp.destroy

    respond_to do |format|
      format.html { redirect_to comps_url }
      format.json { head :no_content }
    end
  end
  
  
end
