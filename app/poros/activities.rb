class Activities
  attr_reader :id, :activities, :destination, :forecast

  def initialize(data_hash)
    @id = nil
    @activities = format_activity(data_hash)
    @destination = data_hash[:destination]
    @forecast = format_forecast(data_hash)
  end

  private

  def format_activity(data_hash)
    data_hash[:activities].map do |activity|
      {
        title: activity[:activity],
        type: activity[:type],
        participants: activity[:participants],
        price: activity[:price]
      }
    end
  end

  def format_forecast(data_hash)
    {
      summary: data_hash[:weather].current_weather[:conditions],
      temperature: data_hash[:weather].current_weather[:temperature]
    }
  end
end
