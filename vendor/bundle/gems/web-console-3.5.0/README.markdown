<p align=right>
  Documentation for:
  <a href=https://github.com/rails/web-console/tree/v1.0.4>v1.0.4</a>
  <a href=https://github.com/rails/web-console/tree/v2.2.1>v2.2.1</a>
  <a href=https://github.com/rails/web-console/tree/v3.0.0>v3.0.0</a>
</p>

# Web Console [![Build Status](https://travis-ci.org/rails/web-console.svg?branch=master)](https://travis-ci.org/rails/web-console)

_Web Console_ is a debugging tool for your Ruby on Rails applications.

- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [FAQ](#faq)
- [Credits](#credits)

## Installation

_Web Console_ is meant to work as a Rails plugin. To install it in your current
application, add the following to your `Gemfile`.

```ruby
group :development do
  gem 'web-console'
end
```

After you save the `Gemfile` changes, make sure to run `bundle install` and
restart your server for the _Web Console_ to kick in.

## Usage

The web console allows you to create an interactive Ruby session in your
browser. Those sessions are launched automatically in case on an error, but
they can also be launched manually in any page.

For example, calling `console` in a view will display a console in the current
page in the context of the view binding.

```html
<% console %>
```

Calling `console` in a controller will result in a console in the context of
the controller action:

```ruby
class PostsController < ApplicationController
  def new
    console
    @post = Post.new
  end
end
```

The method is defined in `Kernel` and you can invoke it any application code.

Only one `console` invocation is allowed once per request. If you happen to
have multiple ones, a `WebConsole::DoubleRenderError` will be raised.

## Configuration

_Web Console_ allows you to execute arbitrary code on the server, so you
should be very careful, who you give access to.

### config.web_console.whitelisted_ips

By default, only requests coming from IPv4 and IPv6 localhosts are allowed.

`config.web_console.whitelisted_ips` lets you control which IP's have access to
the console.

You can whitelist single IP's or whole networks. Say you want to share your
console with `192.168.0.100`. You can do this:

```ruby
class Application < Rails::Application
  config.web_console.whitelisted_ips = '192.168.0.100'
end
```

If you want to whitelist the whole private network, you can do:

```ruby
Rails.application.configure do
  config.web_console.whitelisted_ips = '192.168.0.0/16'
end
```

Take a note that IPv4 and IPv6 localhosts are always allowed. This wasn't the
case in 2.0.

### config.web_console.whiny_requests

When a console cannot be shown for a given IP address or content type, a
messages like the following is printed in the server logs:

> Cannot render console from 192.168.1.133! Allowed networks:
> 127.0.0.0/127.255.255.255, ::1

If you don't wanna see this message anymore, set this option to `false`:

```ruby
Rails.application.configure do
  config.web_console.whiny_requests = false
end
```

### config.web_console.template_paths

If you wanna style the console yourself, you can place `style.css` at a
directory pointed by `config.web_console.template_paths`:

```ruby
Rails.application.configure do
  config.web_console.template_paths = 'app/views/web_console'
end
```

You may wanna check the [templates] folder at the source tree for the files you
may override.

### config.web_console.mount_point

Usually the middleware of _Web Console_ is mounted at `/__web_console`.
If you wanna change the path for some reasons, you can specify it
by `config.web_console.mount_point`:

```ruby
Rails.application.configure do
  config.web_console.mount_point = '/path/to/web_console'
end
```

## FAQ

### Where did /console go?

The remote terminal emulator was extracted in its own gem that is no longer
bundled with _Web Console_.

If you miss this feature, check out [rvt].

### Why I constantly get unavailable session errors?

All of _Web Console_ sessions are stored in memory. If you happen to run on a
multi-process server (like Unicorn) you may get unavailable session errors
while the server is still running. This is because a request may hit a
different worker (process) that doesn't have the desired session in memory.
To avoid that, if you use such servers in development, configure them so they
server requests only out of one process.

### How to inspect local and instance variables?

The interactive console executes Ruby code. Invoking `instance_variables` and
`local_variables` will give you what you want.

### Why does console only appear on error pages but not when I call it?

This can be happening if you are using `Rack::Deflater`. Be sure that
`WebConsole::Middleware` is used after `Rack::Deflater`. The easiest way to do
this is to insert `Rack::Deflater` as early as possible

```ruby
Rails.application.configure do
  config.middleware.insert(0, Rack::Deflater)
end
```

### Why I'm getting an undefined method `web_console`?

Make sure your configuration lives in `config/environments/development.rb`.

## Credits

* Shoutout to [Charlie Somerville] for [better_errors].
* Kudos to [John Mair] for [binding_of_caller] and [debug_inspector].
* Thanks to [Charles Oliver Nutter] for all the _JRuby_ feedback.
* Hugs and kisses to all of our [contributors]!

[better_errors]: https://github.com/charliesome/better_errors
[debug_inspector]: https://github.com/banister/debug_inspector
[binding_of_caller]: https://github.com/banister/binding_of_caller
[Charlie Somerville]: https://github.com/charliesome
[John Mair]: https://github.com/banister
[Charles Oliver Nutter]: https://github.com/headius
[templates]: https://github.com/rails/web-console/tree/master/lib/web_console/templates
[rvt]: https://github.com/gsamokovarov/rvt
[contributors]: https://github.com/rails/web-console/graphs/contributors
