class RepetitionsController < ApplicationController
  before_action :set_repetition, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /repetitions or /repetitions.json
  def index
    @repetitions = Repetition.all
  end

  # GET /repetitions/1 or /repetitions/1.json
  def show
  end

  # GET /repetitions/new
  def new
    @repetition = Repetition.new
  end

  # GET /repetitions/1/edit
  def edit
  end

  # POST /repetitions or /repetitions.json
  def create
    @repetition = Repetition.new(repetition_params)

    respond_to do |format|
      if @repetition.save
        format.html { redirect_to repetition_url(@repetition), notice: "Repetition was successfully created." }
        format.json { render :show, status: :created, location: @repetition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repetition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repetitions/1 or /repetitions/1.json
  def update
    respond_to do |format|
      if @repetition.update(repetition_params)
        format.html { redirect_to repetition_url(@repetition), notice: "Repetition was successfully updated." }
        format.json { render :show, status: :ok, location: @repetition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repetition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repetitions/1 or /repetitions/1.json
  def destroy
    @repetition.destroy

    respond_to do |format|
      format.html { redirect_to repetitions_url, notice: "Repetition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repetition
      @repetition = Repetition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repetition_params
      params.require(:repetition).permit(:count)
    end
end
