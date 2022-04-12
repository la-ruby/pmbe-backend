# frozen_string_literal: true

# Must rename this
class SpreadsheetsController < ApplicationController
  def edit
  end

  def update
    Rails.logger.info "Received #{params[:spreadsheet]}"
    flash[:notice] = "Uploaded"
    redirect_to "/spreadsheet/edit"
  end
end
