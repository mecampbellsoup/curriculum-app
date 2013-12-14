---
tags: sinatra, rspec
language: ruby
---

# Sinatra, RSpec, and Rack::Test

You can write tests to make sure that your Sinatra application responds
to the expected routes, and that your route handlers respond with the
expected information.

Start with `route_spec.rb` and write the code in `app.rb` that makes the
tests pass.

After all your tests pass, use `rackup` to run your app, and then make
sure it works in the browser as well.

How do you get the /hello path to work with a name?
`hint: you need query string parameters`

# Deliverable

Post a link to a github repo for this problem, with passing specs, to
Piazza
