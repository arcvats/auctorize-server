require "jwt"

module Auth
  class Core
    ALGORITHM = "HS256"

    def self.issue(payload, expiry=2.hours)
      issued_at = Time.now.to_i
      jti = SecureRandom.hex
      exp = (issued_at + expiry).to_i
      fields = {
        jti: jti,
        iat: issued_at,
        exp: exp
      }
      payload = payload.merge(fields)
      token = JWT.encode(payload, auth_secret, ALGORITHM)
      { jti: jti, exp: exp, token: token }
    end

    def self.decode(token, verify=true)
      JWT.decode(token, auth_secret, verify, algorithm: ALGORITHM, verify_iat: true).first
    end

    def self.auth_secret
      Rails.application.credentials.auth_secret
    end
  end
end