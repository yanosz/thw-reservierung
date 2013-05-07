class SessionsController < ApplicationController
  skip_before_filter :authenticate
  # GET /sessions/new
  # GET /sessions/new.xml
  def new
    @session = Session.new
    session[:user] = nil   
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.xml
  def create
    session[:user] = User.authenticate(params[:session][:login],params[:session][:password])
    @session = Session.new
    respond_to do |format|
      if session[:user]
        format.html { redirect_to(rentals_url, :notice => 'Anmeldung erfolgreich') }
      else
        format.html { redirect_to(new_session_url, :notice => 'Benutzername / Kennwort falsch' )}
      end
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.xml
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to(@session, :notice => 'Session was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
 end
