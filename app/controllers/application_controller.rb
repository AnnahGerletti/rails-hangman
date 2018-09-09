class ApplicationController < ActionController::Base
rescue_from ActiveRecord::RecordNotFound, :with => :not_found

def not_found
  # render plain: 'Not found', :status => 404
    render file: '../views/layouts/not_found', :status => 404
end
end
