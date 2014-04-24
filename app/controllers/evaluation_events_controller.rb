class EvaluationEventsController < ApplicationController

  # GET /evaluation_events/new
  def new
    @evaluation_event = EvaluationEvent.new
  end

  # POST /evaluation_events
  def create
    @evaluation_event = EvaluationEvent.new(evaluation_event_params)

    respond_to do |format|
      if @evaluation_event.save
        format.html { render action: 'new_observation' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # GET /evaluation_events/1/observation/1
  def new_observation
  end

  private
  def evaluation_event_params
    params.require(:evaluation_event).permit(:_instrument_id, :worker_id, :evaluation_date)
  end
end
