require_relative 'redis'

Sidekiq.strict_args!(:warn) # https://github.com/sidekiq/sidekiq/blob/main/docs/7.0-Upgrade.md#strict-arguments

Sidekiq.configure_server do |config|
  config.redis = RedisConfig.common_config.merge(
    error_handler: -> (error:, client_info:) {
      Rails.logger.error "Sidekiq Redis error: #{error.class} - #{error.message}"
      Rails.logger.error error.backtrace.join("\n")
    }
  )
end

Sidekiq.configure_client do |config|
  config.redis = RedisConfig.common_config.merge(
    error_handler: -> (error:, client_info:) {
      Rails.logger.error "Sidekiq Redis error: #{error.class} - #{error.message}"
      Rails.logger.error error.backtrace.join("\n")
    }
  )
end
