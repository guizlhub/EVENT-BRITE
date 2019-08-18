class EventpicturesController < ApplicationController

    def create
        @event = event.find(params[:event_id])
        @event.eventpicture.attach(params[:avatar])
        redirect_to(event_path(@event))
        end
    end
