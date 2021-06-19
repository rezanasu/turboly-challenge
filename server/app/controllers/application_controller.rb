class ApplicationController < ActionController::API
    
  
    def encode_token(payload)
        JWT.encode(payload, 'SECRET')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          # header: { 'Authorization': 'Bearer <token>' }
          begin
            JWT.decode(token, 'SECRET', true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
    end

end
