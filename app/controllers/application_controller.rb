class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :null_session
  layout :layout_by_resource

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
