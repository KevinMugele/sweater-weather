module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: {
          errors:
            e.record.errors.full_messages.map do |message|
              {
                status: '422',
                title: 'Could not process',
                detail: "Your record could not be saved: #{message}"
              }
            end
        }
    end

    rescue_from ActionController::BadRequest do |e|
      render json: {
        message: 'Invalid Request',
        error: { details: e.message }
      }, status: 400
    end
  end
end
