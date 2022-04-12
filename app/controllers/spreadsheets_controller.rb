# frozen_string_literal: true

# Must rename this
class SpreadsheetsController < ApplicationController
  def edit
  end

  def update
    Rails.logger.info "Received #{params[:spreadsheet]}"
    Roo::Spreadsheet.open(params[:spreadsheet])
      .sheet('Sheet1')
      .each_row_streaming(offset: 3) do |row|
      next if row[0].is_a?(Roo::Excelx::Cell::Empty)
      puts row[0]
    end
    flash[:notice] = "Uploaded"
    redirect_to "/upload"
  end
end
