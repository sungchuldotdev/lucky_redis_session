# lucky_redis_session

A HTTP::Handler for Lucky to support Redis backed session.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     lucky_redis_session:
       github: sungchuldotdev/lucky_redis_session
   ```
2. Run `shards install`
3. open app_server.cr in your Lucky app
4. add require "lucky_redis_session" on top of the file
3. replace Lucky::SessionHandler.new with RedisSessionHandler.new in app_server.cr in your lucky app.
4. Start redis
5. Lucky dev and enjoy.

## Usage

```crystal
require "lucky_redis_session"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/lucky_redis_session/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request