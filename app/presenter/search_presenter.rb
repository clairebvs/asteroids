class SearchPresenter

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def asteroids
    response = Faraday.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=2018-09-08&end_date=2018-09-14&api_key=#{ENV["NASA_KEY"]}")

    @dangerous_days = {}

    JSON.parse(response.body, symbolize_names: true)[:near_earth_objects].map do |date, asteroid_data|
      count_asteroid = []
      asteroid_data.map do |asteroid|
        if asteroid[:is_potentially_hazardous_asteroid] == true
          count_asteroid << asteroid
        end
      end
      @dangerous_days[date] = count_asteroid
    end
    @dangerous_days.each do |date, asteroids_data|
      asteroids_data.map do |asteroid_data|
        require "pry"; binding.pry
        Asteroid.new(asteroids_data)
      end
    end
  end

  def most_dangerous_day
    # require "pry"; binding.pry
  end
end
