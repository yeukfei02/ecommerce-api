# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  before_action :default_format_json

  def default_format_json
    request.format = 'json' unless request.fullpath.include? '/admin'
  end
end
