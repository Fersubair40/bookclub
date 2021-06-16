module Authenticate
  def current_user
    return  @current_user if @current_user
    header = request.headers['Authorization']
    return  nil if header.nil? or header == 'null'
    decoded = JsonWebToken.decode(header)

    @current_user = User.find(decoded[:user_id]) rescue
      ActiveRecord::RecordNotFound
  end

  private
  def authenticate
    render json: {message: 'No Authentication token'}, status: :unauthorized unless self.current_user
  end
end