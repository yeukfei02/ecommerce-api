class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    before_action :default_format_json

    def default_format_json
        request.format = 'json'
    end
end
