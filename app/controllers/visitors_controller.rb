class VisitorsController < ApplicationController
  def index
    @visitors = Visitor.all

    respond_to do |format|
      format.html
      format.json { render json: @visitors }
    end
  end

  def new
    @visitor = Visitor.new

    respond_to do |format|
      format.html
      format.json { render json: @visitor }
    end
  end

  def create
    @visitor = Visitor.create(visitor_params)

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: 'Visitor was successfully created.' }
        format.json { render json: @visitor, status: :created, location: @visitor }
      else
        format.html { render action: 'new' }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @visitor = Visitor.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @visitor }
    end
  end

  def edit
    @visitor = Visitor.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @visitor }
    end
  end

  def update
    @visitor = Visitor.find(params[:id]) rescue nil

    unless @visitor
      redirect_to root_url, :error => 'You cannot update this visitor!'
    end

    respond_to do |format|
      if @visitor.update_attributes(visitor_params)
        format.html { redirect_to @visitor, notice: 'Visitor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @visitor = Visitor.find(params[:id]) rescue nil

    unless @visitor
      redirect_to root_url, :error => 'You cannot delete this visitor!'
    end

    @visitor.destroy

    respond_to do |format|
      format.html { redirect_to_visitor_url }
      format.json { head :no_content }
    end
  end

  private

  def visitor_params
    params.require(:visitor).permit(:name, :email, :phone, :address)
  end
end
