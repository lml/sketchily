# Sketchily

Sketchily allows the easy integration of svg-edit with any rails application.
Currently supports svg-edit-2.6.

## Installation

Add this line to your application's Gemfile:

    gem 'sketchily'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sketchily

## Usage

Sketchily adds a new form element which can be accessed by calling sketchily_tag from inside a form_tag or f.sketchily from inside a form_for |f|.
Both functions accept a name string, an optional SVG string to be edited and an options hash.
When the form is submitted, the given name string will be used to send the modified SVG string back to the server.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create tests for your feature
4. Ensure that all tests succeed
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
