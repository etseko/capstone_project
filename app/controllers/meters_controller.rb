class MetersController < ApplicationController
  #before_action :set_meter, only: [:show, :edit, :update, :destroy]

  # GET /meters
  # GET /meters.json
  def index
    @meters = Meter.all
  end

  # GET /meters/1
  # GET /meters/1.json
  def show
  end

  # GET /meters/new
  def new
    @meter = Meter.new
  end

  # GET /meters/1/edit
  def edit
    @meter = Meter.find(params[:id])
  end

  # POST /meters
  # POST /meters.json
  def create
    @meter = Meter.new(meter_params)

    respond_to do |format|
      if @meter.save
        format.html { redirect_to @meter, notice: 'Meter was successfully created.' }
        format.json { render :show, status: :created, location: @meter }
      else
        format.html { render :new }
        format.json { render json: @meter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meters/1
  # PATCH/PUT /meters/1.json
  def update
    @meter = Meter.find(params[:id])
      if @meter.update(meter_params)
        redirect_to meters_path, notice: 'Meter was successfully updated.'
        #format.json { render :show, status: :ok, location: @meter }
      else
        render :edit
        #format.json { render json: @meter.errors, status: :unprocessable_entity }
      end
  end


  # DELETE /meters/1
  # DELETE /meters/1.json
  def destroy
    @meter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  #  def set_meter
  #    @meter = Meter.find(params[:id])
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meter_params
      params.require(:meter).permit(:start_date, :end_date, :readings)
    end
end
