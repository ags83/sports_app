class CompsController < ApplicationController
  # GET /comps
  # GET /comps.json
  def index
    @comps = Comp.all

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
  end

  # POST /comps
  # POST /comps.json
  def create
  
    @comp = Comp.new(params[:comp])
	@games = Game.find_all_by_comp_id(nil)

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

    respond_to do |format|
      if @comp.update_attributes(params[:comp])
        format.html { redirect_to @comp, notice: 'Comp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comp.errors, status: :unprocessable_entity }
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
