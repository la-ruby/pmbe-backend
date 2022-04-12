# frozen_string_literal: true

# Must rename this
class ExperimentsController < ApplicationController
  before_action :set_cors_headers
  before_action :set_experiment, only: %i[show edit update destroy]

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
  # def experiment_params
  #   params.require(:experiment).permit(:title, :body, :seed)
  # end

  def set_cors_headers
    # response.set_header "Access-Control-Allow-Origin", origin
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
