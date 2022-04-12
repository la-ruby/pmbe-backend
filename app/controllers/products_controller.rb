# frozen_string_literal: true

# Must rename this
class ProductsController < ApplicationController
  before_action :relax_cors
  before_action :set_product, only: %i[show]

  def show
    json = if @product && params[:token] == ENV['PMBE_TOKEN']
             SpreadsheetsController::HEADINGS_HASH.keys.to_h do |item|
               [item.sub(/\Ax_/, ''), @product.attributes[item].presence || '-']
             end
           else
             {}
           end
    render json: json
  end

  private

  def set_product
    decoded = Base64.decode64(params[:displayname])
    Rails.logger.info "<< Request for  #{decoded} with token #{params[:token]}"
    @product = begin
      Product.find_by_x_displayname! decoded
    rescue StandardError
      nil
    end
  end

  def relax_cors
    # response.set_header "Access-Control-Allow-Origin", origin
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
