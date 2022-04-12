class ExperimentsController < ApplicationController
  before_action :set_experiment, only: %i[ show edit update destroy ]

  # GET /experiments/1 or /experiments/1.json
  def show
    render plain: rand(1..999)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experiment
      # @experiment = Experiment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def experiment_params
      params.require(:experiment).permit(:title, :body, :seed)
    end
end
