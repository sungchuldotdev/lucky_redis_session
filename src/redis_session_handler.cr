require "redis"

class RedisSessionHandler
    include HTTP::Handler
    
    def call(context : HTTP::Server::Context)
      session_id = context.cookies.get?("_session")
      if session_id == nil
        session_id = Random::Secure.urlsafe_base64(32)
        context.cookies.set("_session", session_id)
        write_cookies(context)
      end
      if session_id
        read_session(context, session_id)
        call_next(context)
        write_session(context, session_id)
      end      
    end

    private def read_session(context : HTTP::Server::Context, session_id : String)
      redis = Redis.new
      context.session
      a = redis.get(session_id)
      if a
        JSON.parse(a).as_h.each do |key, value|
          context.session.set key, value.as_s
        end
      end
    end

    private def write_cookies(context : HTTP::Server::Context) : Void
      response = context.response
      context.cookies.updated.each do |cookie|
        response.cookies[cookie.name] = cookie
      end
    end

    private def write_session(context : HTTP::Server::Context, session_id : String) : Void
      redis = Redis.new
      redis.set(session_id, context.session.to_json)
    end
  end
  