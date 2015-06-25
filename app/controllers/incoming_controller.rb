class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    app = App.find_by(url: request.env['HTTP_ORIGIN'])
    @event = app.events.build(event_params)

    if app.nil?
      render json: "Invalid Application", status: :unprocessable_entity
    elsif @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end
end
