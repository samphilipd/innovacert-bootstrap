class EvaluationEventsController < ApplicationController
  def new
    @evaluation_event = EvaluationEvent.new
  end

  def create

  end

  private
  def evaluation_event_params
    params.require(:evaluation_event).permit(:_instrument_id, :worker_id, :evaluation_date)
  end
    
end
