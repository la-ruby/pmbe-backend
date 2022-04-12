# frozen_string_literal: true

# Must rename this
class SpreadsheetsController < ApplicationController
  def edit
  end

  def update
    Rails.logger.info "Received #{params[:spreadsheet]}"
  end
end
