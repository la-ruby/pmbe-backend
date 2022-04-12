# frozen_string_literal: true

# Must rename this
class ProductsController < ApplicationController
  before_action :relax_cors
  before_action :set_product, only: %i[ show ]

  def show
    a = SpreadsheetsController::HEADINGS_HASH.keys
    b = Hash[SpreadsheetsController::HEADINGS_HASH.keys.collect{|item| [item, @product.attributes[item]]}]
    debugger
    render json: { vendor_name: @product&.display_name || "dummy_product_name#{rand(0..1000)}" }
  end

  private

  def set_product
    @product = Product.first # find_by_display_name! Base64.decode64(params[:display_name])
  rescue
    nil
  end

  def relax_cors
    # response.set_header "Access-Control-Allow-Origin", origin
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
