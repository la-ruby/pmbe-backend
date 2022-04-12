# frozen_string_literal: true

# Must rename this
class SpreadsheetsController < ApplicationController
  def edit
  end

  def update
    Rails.logger.info "Received #{params[:spreadsheet]}"
    a = Roo::Spreadsheet.open(params[:spreadsheet])
    a.header_line = 3
    a.each(division: 'DIVISION') do |item|
      puts item.class
    end
    flash[:notice] = "Uploaded"
    redirect_to "/upload"
  end
end
