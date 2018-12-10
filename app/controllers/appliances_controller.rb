class AppliancesController < ApplicationController
  #before_action :set_appliance, only: [:show, :edit, :update, :destroy]

  # GET /appliances
  # GET /appliances.json
  def index
    @appliances = Appliance.all
  end

  # GET /appliances/1
  # GET /appliances/1.json
  def show
  end

  # GET /appliances/new
  def new
    @appliance = Appliance.new
  end

  # GET /appliances/1/edit
  def edit
    @appliance= Appliance.find(params[:id])
  end

  # POST /appliances
  # POST /appliances.json
  def create
    @appliance = Appliance.new(appliance_params)

      if @appliance.save
        redirect_to appliances_path, notice: 'Appliance was successfully created.'
        #format.json { render :show, status: :created, location: @appliance }
      else
        render :new
        #format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /appliances/1
  # PATCH/PUT /appliances/1.json
  def update
    @appliance = Appliance.find(params[:id])
      if @appliance.update(appliance_params)
        redirect_to appliances_path, notice: 'Appliance was successfully updated.'
        #format.json { render :show, status: :ok, location: @appliance }
      else
        render :edit
        #format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
  end


  # DELETE /appliances/1
  # DELETE /appliances/1.json
 def destroy
    @appliance.destroy
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_appliance
    #  @appliance = Appliance.find(params[:id])
  #  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appliance_params
      params.require(:appliance).permit(:category,:brand, :model, :wattage_label, :usage_hourspday, :rating)
    end
end
