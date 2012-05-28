class TalesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:awaiting,:show]
  load_and_authorize_resource
  # GET /tales
  # GET /tales.json
  def index
    #@tales = Tale.all
    #@tales = Tale.find(:all, :conditions => ['main like ? ', true])

    @tales = Tale.paginate(:page => params[:page], :per_page => 5, :conditions => ['main like ? ', true]).order('created_at DESC')
    
    @title = 'main'    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tales }
    end
  end

  def awaiting
    #@tales = Tale.find(:all, :conditions => ['main like ? ', false])
    @tales = Tale.paginate(:page => params[:page], :per_page => 5, :conditions => ['main like ? ', false]).order('created_at DESC')
    
    @title = 'awaiting'
  end
  
  # GET /tales/1
  # GET /tales/1.json
  def show
    @tale = Tale.find(params[:id])

    @title = 'tale ' + params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tale }
    end
  end

  # GET /tales/new
  # GET /tales/new.json
  def new
    @tale = Tale.new

    @title = 'add new tale'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tale }
    end
  end

  # GET /tales/1/edit
  def edit
    @tale = Tale.find(params[:id])
    
    @title = 'edit tale'
  end

  # POST /tales
  # POST /tales.json
  def create
    #@tale = Tale.new(params[:tale])
    @tale = current_user.tales.create(params[:tale])
    
    respond_to do |format|
      if @tale.save
        format.html { redirect_to @tale, notice: 'Tale was successfully created.' }
        format.json { render json: @tale, status: :created, location: @tale }
      else
        format.html { render action: "new" }
        format.json { render json: @tale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tales/1
  # PUT /tales/1.json
  def update
    @tale = Tale.find(params[:id])

    respond_to do |format|
      if @tale.update_attributes(params[:tale])
        format.html { redirect_to @tale, notice: 'Tale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tales/1
  # DELETE /tales/1.json
  def destroy
    @tale = Tale.find(params[:id])
    @tale.destroy

    respond_to do |format|
      format.html { redirect_to tales_url }
      format.json { head :no_content }
    end
  end
  
  def tothemain
    @tale = Tale.find(params[:id])
    @tale.update_attribute(:main, true)
    
    redirect_to tales_url
  end
  
  def totheawaiting
    @tale = Tale.find(params[:id])
    @tale.update_attribute(:main, false)
    
    redirect_to awaiting_path
  end
end
