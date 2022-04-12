# frozen_string_literal: true

# Must rename this
class ProductsController < ApplicationController
  before_action :relax_cors

  def show
    render plain: rand(1..999)
  end

  private

  def relax_cors
    # response.set_header "Access-Control-Allow-Origin", origin
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
