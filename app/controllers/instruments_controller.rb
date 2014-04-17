class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:edit, :show, :destroy, :update]
  before_action :set_sections, only: [:show, :edit, :new]
  attr_accessor :no_js

  # GET /instruments/1
  def show
  end

  # GET /instruments/1/edit
  # todo if client has Javascript (option set client-side), render x, else render y (non-javascript form available)
  # default rendering is JS enabled
  def edit
    @no_js = true
    respond_to do |format|
      format.html
    end
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
    params.require(:instrument).permit(:name, :ucl_id, :_add_observation_section, :_add_interview_section,
                                       observation_sections_attributes: [:id, :name, :_add_question, :_destroy,
                                                                         observation_questions_attributes: [:id, :content, :_destroy]],
                                       interview_sections_attributes: [:id, :name, :_add_question, :_destroy,
                                                                       interview_questions_attributes: [:question_content, :sample_answer, :id, :_destroy]])
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def set_sections
    @observation_sections = ObservationSection.where(:instrument_id => params[:id]).order(id: :asc)
    @interview_sections = InterviewSection.where(:instrument_id => params[:id]).order(id: :asc)
  end
end
