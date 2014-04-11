class InstrumentsController < ApplicationController

  # GET /instruments/new
  def new
    @instrument = Instrument.new
  end

  # POST /instruments
  def create
    @instrument = Instrument.new(instrument_params)
    respond_to do |format|
      if @instrument.save
        format.html { redirect_to root_url, notice: "Instrument created successfully!" }
      else
        format.html { render action: :new }
      end
    end
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
   def instrument_params
     params.require(:instrument).permit(:name, :ucl_id)
   end

end
