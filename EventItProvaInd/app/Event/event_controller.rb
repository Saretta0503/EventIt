require 'rho/rhocontroller'
require 'helpers/browser_helper'

class EventController < Rho::RhoController
  include BrowserHelper

  #GET /Event
  def index
    @events = Event.find(:all)
    render :back => '/app'
  end

  # GET /Event/{1}
  def show
    @event = Event.find(@params['id'])
    if @event
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Event/new
  def new
    @event = Event.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Event/{1}/edit
  def edit
    @event = Event.find(@params['id'])
    if @event
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Event/create
  def create
    @event = Event.create(@params['event'])
    redirect :action => :index
  end

  # POST /Event/{1}/update
  def update
    @event = Event.find(@params['id'])
    @event.update_attributes(@params['event']) if @event
    redirect :action => :index
  end

  # POST /Event/{1}/delete
  def delete
    @event = Event.find(@params['id'])
    @event.destroy if @event
    redirect :action => :index 
  end
  
  def geolocationHttpRequest
    result = Rho::AsyncHttp.get(
      :url => "http://maps.googleapis.com/maps/api/geocode/json?latlng=45.408551,11.886652&sensor=true"
    )
    @get_result = result["body"]
  end
end
