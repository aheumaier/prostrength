class PausesController < ApplicationController
  before_action :set_pause, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /pauses or /pauses.json
  def index
    @pauses = Pause.all
  end

  # GET /pauses/1 or /pauses/1.json
  def show
  end

  # GET /pauses/new
  def new
    @pause = Pause.new
  end

  # GET /pauses/1/edit
  def edit
  end

  # POST /pauses or /pauses.json
  def create
    @pause = Pause.new(pause_params)

    respond_to do |format|
      if @pause.save
        format.html { redirect_to pause_url(@pause), notice: "Pause was successfully created." }
        format.json { render :show, status: :created, location: @pause }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pauses/1 or /pauses/1.json
  def update
    respond_to do |format|
      if @pause.update(pause_params)
        format.html { redirect_to pause_url(@pause), notice: "Pause was successfully updated." }
        format.json { render :show, status: :ok, location: @pause }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pauses/1 or /pauses/1.json
  def destroy
    @pause.destroy

    respond_to do |format|
      format.html { redirect_to pauses_url, notice: "Pause was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pause
      @pause = Pause.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pause_params
      params.require(:pause).permit(:length)
    end
end
