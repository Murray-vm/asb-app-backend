# REDIS = Redis.new(url: ENV.fetch("REDIS_URL", "redis://localhost:6379/1"))
require 'redis'

REDIS_CLIENT = Redis.new(
  url: ENV['REDIS_URL'],
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
)