# frozen_string_literal: true

# Must rename this
class SpreadsheetsController < ApplicationController
  def edit
  end

  def update
    Rails.logger.info "Received #{params[:spreadsheet]}"
    a = Roo::Spreadsheet.open(params[:spreadsheet])
    # a.header_line = 2
    a.each_with_index(division: 'DIVISION') do |item, index|
      next if index == 0
      puts "> #{item.inspect}"
    end
    flash[:notice] = "Uploaded"
    redirect_to "/upload"
  end
end
