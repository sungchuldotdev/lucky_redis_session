class HTTP::Server::Context
    def session : Lucky::Session
        @_session ||= Lucky::Session.new
    end
end
  