class JsonWebToken
  # JWT_SECRET = ENV["JWT_SECRET"] || Rails.application.credentials.secret_key_base
  JWT_SECRET = "agsurncgencyk945hjf87hdfuikduidlfkjdfouifhjdfyudfhjdfuyhjdfydfjkhbdyu"

  def self.encode(payload, exp = 12.hours.from_now)
    payload[:exp] = exp.to_i
    Rails.logger.info("Encoding with key: #{JWT_SECRET}")
    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    Rails.logger.info("Decoding with key: #{JWT_SECRET}")
    begin
      body = JWT.decode(token, JWT_SECRET, true, algorithm: "HS256")[0]
      Rails.logger.info("Decoded payload: #{body}")
      HashWithIndifferentAccess.new(body)
    rescue JWT::DecodeError => e
      Rails.logger.error("Decode error: #{e.message}")
      raise e
    end
  end
end
