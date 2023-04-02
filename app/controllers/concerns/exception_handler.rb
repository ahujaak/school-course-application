module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      respond_to do |format|
        format.json { render json: { errors: [e.message] }, status: :unprocessable_entity }
        format.html { redirect_to '/404.html' }
      end
    end

    rescue_from  CanCan::AccessDenied do |e|
      respond_to do |format|
        format.json { render json: { errors: [e.message] }, status: :unauthorized }
        format.html { redirect_to '/unauthorised.html' }
      end
    end
  end
end
