class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:edit, :show, :destroy, :update]

  # GET /instruments/1
  def show
  end

  # GET /instruments/1/edit
  def edit
  end

  # PATCH/PUT /instruments/1
  def update
    if @instrument.update(instrument_params)
      redirect_to @instrument, notice: 'Instrument was successfully updated.'
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
    #TODO replace this hack with the ability to dynamically add/delete questions/sections,
    # preferably using javascript
    # consider cocoon?
    3.times do
      observation_section = @instrument.observation_sections.build # start with 3 empty section fields
      4.times { observation_section.observation_questions.build }
    end
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
    params.require(:instrument).permit(:name, :ucl_id, observation_sections_attributes: [:id, :name, :_destroy, observation_questions_attributes: [:id, :content, :_destroy]])
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end
end
