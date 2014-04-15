class ObservationSectionsController < ApplicationController
  before_action :set_observation_section, only: [:edit, :update]

  def edit
  end

  def update
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
