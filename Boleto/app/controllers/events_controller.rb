class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def search
    search_word = params[:words]
    @search_result = Array.new
    @events = Event.all
    @events.each do |event|
      if event.title.downcase.include? search_word.downcase 
        @search_result.push(event)
      end
      if event.description.downcase.include? search_word.downcase 
        @search_result.push(event)
      end
    end
  end

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    # get the tickets info for this event
    event_id = params[:id]
    event = Event.find(event_id)
    #Client.find_by_sql("SELECT * FROM clients 
    #INNER JOIN orders ON clients.id = orders.client_id 
    #ORDER clients.created_at desc")
    #select distinct price from tickets where event_id=43434 order by price asc
    #SELECT  "events".* FROM "events" WHERE "events"."id" = ? LIMIT 1
    @price = Ticket.find_by_sql("SELECT DISTINCT price FROM tickets WHERE event_id='"+event.event_id+"' ORDER BY tickets.price asc")
    #@aa = Event.find_by_sql("SELECT * FROM events")
    @ticket_result = Array.new
    @price.each do |p|
      tic_info=Ticket.find_by_sql("SELECT t_id,seller_id,price FROM tickets WHERE price="+p.price.to_s)
      @ticket_result.push(tic_info)

    end


  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_id, :status, :title, :description)
    end
end
