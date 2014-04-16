class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:edit, :show, :destroy, :update]
  before_action :set_sections, only: [:show, :edit, :new]

  # GET /instruments/1
  def show
  end

  # GET /instruments/1/edit
  # todo if client has Javascript (option set client-side), render x, else render y (non-javascript form available)
  # default rendering is JS enabled
  def edit
  end

  # PATCH/PUT /instruments/1
  def update
    if @instrument.update(instrument_params)
      redirect_to instrument_url(@instrument), notice: 'Instrument was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /instruments/1
  def destroy
    @instrument.destroy
    flash[:notice] = "Instrument: #{@instrument.name} deleted"
    redirect_to ucls_url
  end

  # GET /instruments/new
  def new
    @instrument = Instrument.new
    @instrument.observation_sections.build # start with empty section field
  end

  # POST /instruments
  def create
    @instrument = Instrument.new(instrument_params)
    respond_to do |format|
      if @instrument.save
        format.html { redirect_to instrument_url(@instrument), notice: "Instrument created successfully!" }
      else
        format.html { render action: :new }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def instrument_params
    params.require(:instrument).permit(:name, :ucl_id, observation_sections_attributes: [:id, :name, :_destroy], interview_sections_attributes: [:id, :name, :_destroy])
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def set_sections
    @observation_sections = ObservationSection.where(:instrument_id => params[:id]).order(id: :asc)
    @interview_sections = InterviewSection.where(:instrument_id => params[:id]).order(id: :asc)
  end
end
