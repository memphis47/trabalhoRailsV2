# encoding: utf-8
class OrchestrasController < ApplicationController
  before_action :set_orchestra, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user, only: [:index,:show]
  

  # GET /orchestras
  # GET /orchestras.json
  def index
    @orchestras = Orchestra.all
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
  end

  # GET /orchestras/1
  # GET /orchestras/1.json
  def show
  end

  # GET /orchestras/new
  def new
    @orchestra = Orchestra.new
    @conductor = Conductor.all
  end

  # GET /orchestras/1/edit
  def edit
    @conductor = Conductor.all
  end

  # POST /orchestras
  # POST /orchestras.json
  def create
    @orchestra = Orchestra.new(orchestra_params)
    
    if(!Orchestra.where(name: @orchestra.name).exists?(conditions = :none))
      @orcs=Orchestra.where(conductor_id: @orchestra.conductor_id)
      if(@orcs.first!=nil)
          
          @orcs.first.conductor_id=nil
          @orcs.first.save
      end
      respond_to do |format|
        if @orchestra.save
          format.html { redirect_to @orchestra, notice: 'Orchestra was successfully created.' }
          format.json { render action: 'show', status: :created, location: @orchestra }
        else
          format.html { render action: 'new' }
          format.json { render json: @orchestra.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        @conductor = Conductor.all
        format.html { render action: "new" , notice: 'orquestra jah criada'}
        format.json { render json: @orchestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orchestras/1
  # PATCH/PUT /orchestras/1.json
  def update
    
    @orcs=Orchestra.where(conductor_id:  params[:orchestra][:conductor_id])
      if(@orcs.first!=nil)

          @orcs.first.conductor_id=nil
          @orcs.first.save
      end
    respond_to do |format|
      if @orchestra.update(orchestra_params)
        format.html { redirect_to @orchestra, notice: 'Orchestra was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @orchestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orchestras/1
  # DELETE /orchestras/1.json
  def destroy
    @orchestra.destroy
    respond_to do |format|
      format.html { redirect_to orchestras_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orchestra
      @orchestra = Orchestra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orchestra_params
      params.require(:orchestra).permit(:name, :city, :conductor_id)
    end
end
