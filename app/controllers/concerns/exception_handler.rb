module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: {
          errors:
            e.record.errors.full_messages.map do |message|
              {
                status: '422',
                title: 'Unprocessable Entity',
                detail: "Your record could not be saved: #{message}"
              }
            end
        }
    end
  end
end
