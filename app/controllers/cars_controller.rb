class CarsController < ApplicationController
  # GET /cars
  # GET /cars.xml
  def index
    @cars = Car.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cars }
    end
  end

  # GET /cars/new
  # GET /cars/new.xml
  def new
    @car = Car.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @car }
    end
  end

  # GET /cars/1/edit
  def edit
    @car = Car.find(params[:id])
  end

  # POST /cars
  # POST /cars.xml
  def create
    @car = Car.new(params[:car])

    respond_to do |format|
      if @car.save
        format.html { redirect_to(cars_url, :notice => 'Fahrzeug erfolgreich angelegt') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /cars/1
  # PUT /cars/1.xml
  def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to(cars_url, :notice => 'Fahrzeug erfolgreich bearbeitet.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.xml
  def destroy
    @car = Car.find(params[:id])
    @car.destroy

    respond_to do |format|
      format.html { redirect_to(cars_url) }
    end
  end
end
