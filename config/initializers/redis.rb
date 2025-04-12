module RedisConfig
  def self.common_config
    {
      url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0'),
      ssl_params: {
        ca_file: ENV['REDIS_CA_FILE'],
        verify_mode: ENV['REDIS_OPENSSL_VERIFY'].to_i == 0 ? OpenSSL::SSL::VERIFY_NONE : OpenSSL::SSL::VERIFY_PEER,
        ssl_version: :TLSv1_2
      },
      network_timeout: 5,
      pool_timeout: 5
    }
  end
end 