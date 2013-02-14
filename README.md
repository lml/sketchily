# Sketchily

Sketchily allows the easy integration of [svg-edit](http://code.google.com/p/svg-edit/) with any rails application.

Currently supports and provides `svg-edit-2.6`.

## Installation

Add this line to your application's Gemfile:

    gem 'sketchily'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sketchily

## Usage

Sketchily adds new form elements which can be accessed by calling:

- `f.sketchily` or simply `sketchily` from inside a `form_for @my_object |f|`
- `sketchily_tag` from inside a `form_tag`

This gem also adds a helper method that can be called to display the resulting SVG images (without an editor):

- `sketchily_show` from any view template

### `sketchily` and `sketchily_tag` functions

- Both of these functions work exactly like the equivalent `hidden_field` functions, except that svg-edit is displayed instead.
- The `f.sketchily` format accepts a method name and an options hash.
- The sketchily format accepts an object name, a method name and an options hash.
- The `sketchily_tag` format accepts a tag name, the svg string to be edited and an options hash.

Currently available options are:

- `width`
- `height`
- `hide_menu` (true if you want svg-edit's menu to be hidden)
- `hide_image_tool` (true if you want to hide the image tool button)
- `canvas_width` (number specifying initial canvas width)
- `canvas_height` (number specifying initial canvas height)
- `canvas_expansion` (0 if you want to disable scrolling)
- `hide_rulers` (true if you want to hide the canvas rulers)
- other standard html attributes for the input tag

It is recommended that the database entries associated with sketchily form elements be of type `text`.

Example usage (haml):

    = form_for @shirt do |f|
      f.text_field :title
      f.sketchily :svg

### `sketchily_show` helper

- This function takes the base64-encoded SVG string as an argument and an options hash.
- The SVG string can be directly read from the field used by the previous functions.

Currently available options are:

- `width`
- `height`

Passing only one of those options should keep the aspect ratio constant in most browsers.

Example usage (haml):

    = sketchily_show @shirt.svg, :width => "500"

## Browser Support

Although more testing is needed, we currently believe sketchily supports any browsers that svg-edit 2.6 supports, namely:

- Firefox 1.5+
- Opera 9.50+
- Safari 4+
- Chrome 1+
- IE 9+
- IE 6+ (with the Chrome Frame plugin) 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create specs for your feature
4. Ensure that all specs pass
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new pull request
