class SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user
  respond_to :html, :json



  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.access_token,
          email: user.email
        }
        render json: data, status: 201 and return
      end
    end
  end
end
