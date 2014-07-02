class ConductorsController < ApplicationController
  before_action :set_conductor, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user, only: [:index,:show]

  # GET /conductors
  # GET /conductors.json
  def index
    @conductors = Conductor.all

  end

  # GET /conductors/1
  # GET /conductors/1.json
  def show
  end

  # GET /conductors/new
  def new
    @conductor = Conductor.new
    @orchestra = Orchestra.all
    @orchestas=Orchestra.new
  end

  # GET /conductors/1/edit
  def edit
    @orchestra = Orchestra.all
  end

  # POST /conductors
  # POST /conductors.json
  def create
    @conductor = Conductor.new(conductor_params)
    #@orchestas = Orchestra.new()
    respond_to do |format|
      if @conductor.save
        @orcs=Orchestra.where(id: params[:orchestas][:id])
        @orcs.first.conductor_id=@conductor.id
    
        if @orcs.first.save
          format.html { redirect_to @conductor, notice: 'Conductor was successfully created.' }
          format.json { render action: 'show', status: :created, location: @conductor }
        else
          format.html { render action: 'new' }
          format.json { render json: @conductor.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conductors/1
  # PATCH/PUT /conductors/1.json
  def update
    respond_to do |format|
      if @conductor.update(conductor_params)
        @orcs=Orchestra.where(conductor_id: @conductor.id)
        if(@orcs.first!=nil)
          @orcs.first.conductor_id=nil
          @orcs.first.save
        end
        @orcs=Orchestra.where(id: params[:orchestas][:id])
        @orcs.first.conductor_id=@conductor.id
    
        if @orcs.first.save
          format.html { redirect_to @conductor, notice: 'Conductor was successfully created.' }
          format.json { render action: 'show', status: :created, location: @conductor }
        else
          format.html { render action: 'edit' }
          format.json { render json: @conductor.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @conductor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conductors/1
  # DELETE /conductors/1.json
  def destroy
    @conductor.destroy
    respond_to do |format|
      format.html { redirect_to conductors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conductor
      @conductor = Conductor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conductor_params
      params.require(:conductor).permit(:name, :age)
    end
end
