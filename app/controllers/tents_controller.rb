# encoding: utf-8
class TentsController < ApplicationController
  # GET /tents
  # GET /tents.xml
  def index
    @tents = Tent.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

   # GET /tents/new
  # GET /tents/new.xml
  def new
    @tent = Tent.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /tents/1/edit
  def edit
    @tent = Tent.find(params[:id])
  end

  # POST /tents
  # POST /tents.xml
  def create
    @tent = Tent.new(params[:tent])

    respond_to do |format|
      if @tent.save
        format.html { redirect_to(tents_url, :notice => 'Zelt erfolgreich angelegt') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /tents/1
  # PUT /tents/1.xml
  def update
    @tent = Tent.find(params[:id])

    respond_to do |format|
      if @tent.update_attributes(params[:tent])
        format.html { redirect_to(tents_url, :notice => 'Zelt erfolgreich geändert') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tents/1
  # DELETE /tents/1.xml
  def destroy
    @tent = Tent.find(params[:id])
    @tent.destroy

    respond_to do |format|
      format.html { redirect_to(tents_url) }
      format.xml  { head :ok }
    end
  end
end
