class InstrumentsController < ApplicationController

  # GET /instruments/new
  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
   def instrument_params
     params.require(:instrument).permit()
   end

end
