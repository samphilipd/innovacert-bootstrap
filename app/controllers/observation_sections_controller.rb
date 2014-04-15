class ObservationSectionsController < ApplicationController
  before_action :set_observation_section, only: [:edit, :update]

  def edit
  end

  def update
    if @observation_section.update(observation_section_params)
      redirect_to edit_instrument_url(@instrument), notice: 'Section was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def observation_section_params
    params.require(:observation_section).permit(:name, observation_questions_attributes: [:id, :content, :_destroy])
  end

  def set_observation_section
    @observation_section = ObservationSection.find(params[:id])
    @instrument = @observation_section.instrument
  end
end
