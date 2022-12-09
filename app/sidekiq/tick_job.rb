class TickJob
  include Sidekiq::Job

  def perform(*args)
    Citizen.find_each do |citizen|
      citizen.tick
    end
  end
end
