# frozen_string_literal: true

# Must rename this
class SpreadsheetsController < ApplicationController
  def edit
  end

  def update
    Rails.logger.info "Received #{params[:spreadsheet]}"
    debugger
    flash[:notice] = "Uploaded"
    redirect_to "/upload"
  end
end
