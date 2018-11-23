class MetersController < ApplicationController

  def show
      @meters = MeterReadings.all
  end

  def new
    @meter = MeterReadings.new
  end

  def create
    @meters = MeterReadings.all
    @meter = MeterReadings.new(meter_params)
    if @meter.save
      #redirect_to @meters, notice: 'The new meter entry has been created.'
      render :show
    else
      render :new
    end
  end

   private

  def meter_params
    params.require(:meter).permit(:start_date,:end_date,:readings)
  end
end
