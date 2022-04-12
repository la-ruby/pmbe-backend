# frozen_string_literal: true

# Must rename this
class ProductsController < ApplicationController
  before_action :relax_cors
  before_action :set_product, only: %i[ show ]

  def show
    render json: { vendor_name: "ABC#{rand(1..100)}" }
  end

  private

  def set_product
    @product = Product.find_by_display_name params[:display_name]
  end

  def relax_cors
    # response.set_header "Access-Control-Allow-Origin", origin
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
