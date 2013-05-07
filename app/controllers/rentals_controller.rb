class RentalsController < ApplicationController
  # GET /rentals
  def index
    @search = Search.new
   if params[:search]
     @search.order = params[:search][:order]
     @search.show_history = params[:search][:show_history]
   end
    @rentals = Rental.find(:all, :order => @search.order_key) if @search.show_history == "1"
    @rentals = Rental.find(:all, :conditions => ["to_date >= ?" ,DateTime.now], :order => @search.order_key) if @search.show_history != "1"
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /rentals/new
  # GET /rentals/new.xml
  def new
    @rental = Rental.new
    @rental.subject_id = params[:subject_id]
    @rental.type = params[:type]
    @rental.user = session[:user].name
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rental }
    end
  end

  # GET /rentals/1/edit
  def edit
    @rental = Rental.find(params[:id])
  end

  # POST /rentals
  # POST /rentals.xml
  def create
    @rental = Rental.new(params[:rental])
    @rental.user = "#{session[:user].name}"
    respond_to do |format|
      if @rental.save
        Thread.new do
          NoticeMailer.deliver_created(@rental)
        end
        format.html { redirect_to(rentals_url, :notice => 'Reservierung / Verleih erfolgreich angelegt') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /rentals/1
  # PUT /rentals/1.xml
  def update
    @rental = Rental.find(params[:id])
    @old_rental = @rental.clone
    respond_to do |format|
      if @rental.update_attributes(params[:rental])
        Thread.new do
          NoticeMailer.deliver_canceled(@old_rental)
          NoticeMailer.deliver_created(@rental)
        end
        format.html { redirect_to(rentals_url, :notice => 'Reservierung / Verleih erfolgreich aktualisiert') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.xml
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    Thread.new do
      NoticeMailer.deliver_canceled(@old_rental)
    end
    respond_to do |format|
      format.html { redirect_to(rentals_url) }
      format.xml  { head :ok }
    end
  end
end
