module RedisConfig
  def self.common_config
    {
      url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0'),
      ssl_params: {
        verify_mode: OpenSSL::SSL::VERIFY_PEER,
        ssl_version: :TLSv1_2
      }.compact,
      timeout: 5,
      ssl: true  # Heroku Redis requires SSL
    }.compact
  end
end 