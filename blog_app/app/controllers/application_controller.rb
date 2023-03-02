class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_cache_headers  
    include Devise::Controllers::Helpers

    private

    def set_cache_headers
        response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "0"
    end
end
