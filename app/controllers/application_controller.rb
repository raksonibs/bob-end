require 'redis'

class ApplicationController < ActionController::API
  def redis
    redis = Redis.new
  end
end
