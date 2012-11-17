class ComposersController < ApplicationController
  def index
    @composers = Composer.all

    respond_to do |format|
      format.html
      format.json { render :json => @composers }
    end
  end

  def show
    @composer = Composer.find_by(slug: params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @composer }
    end
  end

  def new
    @composer = Composer.new
    puts @composer

    respond_to do |format|
      format.html
      format.json { render :json => @composer }
    end
  end

  def create
    @composer = Composer.new(params[:composer])
    @composer.generate_slug

    respond_to do |format|
      if @composer.save
        format.html { redirect_to(@composer,
                                  :notice => 'Composer was successfully created.') }
        format.json { render :json => @composer,
                      :status => :created, :location => @composer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @composer.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @composer = Composer.find_by(slug: params[:id])
  end

  def update
    @composer = Composer.find_by(slug: params[:id])

    respond_to do |format|
      if @composer.update_attributes(params[:composer])
        format.html  { redirect_to(@composer,
                                   :notice => 'Composer was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @composer.errors,
                       :status => :unprocessable_entity }
      end
    end
  end
end
