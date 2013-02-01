# Sketchily

Sketchily allows the easy integration of svg-edit with any rails application.
Currently supports and provides svg-edit-2.6.

## Installation

Add this line to your application's Gemfile:

    gem 'sketchily'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sketchily

## Usage

Sketchily adds new form elements which can be accessed by calling f.sketchily or simply sketchily from inside a form_for |f| or sketchily_tag from inside a form_tag.
Both of these functions work exactly like the equivalent hidden_field functions, except that svg-edit is displayed instead.
The f.sketchily format accepts a method name and an options hash.
The sketchily format accepts an object name, a method name and an options hash.
The sketchily_tag format accepts a tag name, the svg string to be edited and an options hash.
Currently available options are width, height, show_menu (true if you want svg-edit's menu to be displayed) and other standard html attributes.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create specs for your feature
4. Ensure that all specs pass
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new pull request

