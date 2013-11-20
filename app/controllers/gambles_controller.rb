class GamblesController < ApplicationController
  # GET /gambles
  # GET /gambles.json
  def index
    @gambles = Gamble.all
    @groups = Group.actives
    @user_gambles = Gamble.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gambles }
    end
  end

  # GET /gambles/1
  # GET /gambles/1.json
  def show
    @gamble = Gamble.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gamble }
    end
  end

  # GET /gambles/new
  # GET /gambles/new.json
  def new
    @gamble = Gamble.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gamble }
    end
  end

  # GET /gambles/1/edit
  def edit
    @gamble = Gamble.find(params[:id])
  end

  # POST /gambles
  # POST /gambles.json
  def create
    @gamble = Gamble.new(params[:gamble])

    respond_to do |format|
      if @gamble.save
        format.html { redirect_to @gamble, notice: 'Gamble was successfully created.' }
        format.json { render json: @gamble, status: :created, location: @gamble }
      else
        format.html { render action: "new" }
        format.json { render json: @gamble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gambles/1
  # PUT /gambles/1.json
  def update
    @gamble = Gamble.find(params[:id])

    respond_to do |format|
      if @gamble.update_attributes(params[:gamble])
        format.html { redirect_to @gamble, notice: 'Gamble was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gamble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gambles/1
  # DELETE /gambles/1.json
  def destroy
    @gamble = Gamble.find(params[:id])
    @gamble.destroy

    respond_to do |format|
      format.html { redirect_to gambles_url }
      format.json { head :no_content }
    end
  end
  
  def update_or_create_all_gambles
    respond_to do |format|
      gambles = params[:matchgamble]
      id_match = 0
      i = 0
      gambles.each do |gamble|
        gamble.each do |ga|
          if ga["all_gambles"].present?
            gahash = ga["all_gambles"].to_hash
            @gamble = Gamble.find_by_user_id_and_match_id(current_user.id,gamble[0])
            id_match = gamble[0]
            @gamble = Gamble.new() if !@gamble.present? 
            @gamble.team_home_score = gahash["team_home_score"].to_i
            @gamble.team_away_score = gahash["team_away_score"].to_i
            @gamble.user = current_user if !@gamble.user.present?
            @gamble.match_id = gamble[0].to_i if !@gamble.match_id.present?
            @gamble.save if (gahash["team_home_score"].present? && gahash["team_away_score"].present? )          
           # puts "User = #{current_user.id}  Id = #{gamble[0]} gol1 =  #{gahash["team_home_score"].to_s} gol 2 = #{gahash["team_away_score"].to_s}"
          end
        end
      end
      @gambles = Gamble.all
      @groups = Group.actives
      @user_gambles = Gamble.find_all_by_user_id(current_user.id)
      flash[:notice] =  "Apostas salvas com sucesso!"
      flash[:id_match] = id_match.to_s 
      format.js
    end
    #respond_to do |format|
     # format.html{render action: "edit"}
    #end 
  end
end
