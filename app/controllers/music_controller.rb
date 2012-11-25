class MusicController < ApplicationController
  def index
    @music = Music.all

    respond_to do |format|
      format.html
      format.json { render :json => @music }
    end
  end

  def show
    @music = Music.find_by(slug: params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @music }
    end
  end

  def new
    @composers = Composer.all
    @music = Music.new

    respond_to do |format|
      format.html
      format.json { render :json => @music }
    end
  end

  def create
    @composers = Composer.all
    @music = Music.new(params[:music])
    @music.composer = Composer.find_by(:slug => params[:music][:composer])
    @music.update_slug

    respond_to do |format|
      if @music.save
        format.html { redirect_to(@music,
                                  :notice => "Music work #{@music.full_name} was successfully created.") }
        format.json { render :json => @music,
                      :status => :created, :location => @music }
      else
        format.html { render :action => "new" }
        format.json { render :json => @music.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @composers = Composer.all
    @music = Music.find_by(slug: params[:id])
  end

  def update
    @composers = Composer.all
    @music = Music.find_by(slug: params[:id])
    @music.composer = Composer.find_by(:slug => params[:music][:composer])

    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html  { redirect_to(@music,
                                   :notice => 'Music was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @music.errors,
                       :status => :unprocessable_entity }
      end
    end
  end
end
