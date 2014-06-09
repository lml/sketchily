# Sketchily

Sketchily allows the easy integration of [svg-edit](http://code.google.com/p/svg-edit/) with any rails application.

Currently supports and provides `svg-edit-2.7`.

## Installation

Add this line to your application's Gemfile:

```rb
gem 'sketchily', git: 'https://github.com/stevobengtson/sketchily.git'
```

And then execute:

```sh
$ bundle
```

Or install it yourself:

```sh
$ gem install sketchily
```

Also make sure your `application.js` includes some version of jquery. It usually does by default.
If you use the jquery-rails gem, you will have something like this:

```js
//= require jquery
//= require jquery_ujs
```

**Note:** sketchily will **automatically** add the following files to your asset precompilation list:

    sketchily.css sketchily.js sketchily_embed.js svg-edit-2.7/canvg/canvg.js svg-edit-2.7/canvg/rgbcolor.js svg-edit-2.7/extensions/ext-*.js svg-edit-2.7/locale/lang.*.js

Other html files and images used by svg-edit will also be precompiled.

## Usage

Sketchily adds new form elements which can be accessed by calling:

- `f.sketchily` or simply `sketchily` from inside a `form_for @my_object |f|`
- `sketchily_tag` from inside a `form_tag`

This gem also adds a helper method that can be called to display the resulting SVG images (without an editor):

- `sketchily_show` from any view template

### `sketchily` and `sketchily_tag` functions

- Both of these functions work exactly like the equivalent `hidden_field` functions, except that svg-edit is displayed instead.
- The `f.sketchily` format accepts a method name and an options hash.
- The `sketchily` format (called without the form builder object) accepts an object name, a method name and an options hash.
- The `sketchily_tag` format accepts a tag name, the svg string to be edited and an options hash.

Currently available options are:

- `width` total width of editor
- `height` total height of editor

- `bkgd_color` canvas background color (3 or 6 hex digit html color format; not saved with image; see sketchily_show)
- `bkgd_url` canvas background image url (not saved with image; see bkgd_file option for sketchily_show)

- `canvas_width` initial canvas width
- `canvas_height` initial canvas height
- `canvas_expansion` 0 if you want to disable scrolling

- `hide_rulers` true if you want to hide the canvas rulers
- `hide_menu` true if you want svg-edit's menu to be hidden
- `hide_image_tool` true if you want to hide the `image tool` button

- `show_hyperlink_tool` true if you want to show the `hyperlink tool` button (see explanation below)

- `show_layers` (true if you want the layer selector to display automatically when the editor is loaded)

- `url` override contents of the canvas with the svg file in the given url (careful: changes lost whenever editor is loaded)

- `id` override the default id (see explanation below)
- `value` override the default value (the svg itself; can be useful when using form_for)
- `index` override the default index (affects the tag name; can be useful when using form_for)

- `extensions` editor plugins (e.g. 'plugin.js' will load '/assets/extensions/plugin.js')

- other standard html attributes for the input tag

The `hyperlink tool` is disabled by default, as embedded links and scripts do not work with the display method used by sketchily_show.
The sketchily_show helper will display svg's inside of <img> tags, which are treated as static images by most browsers.
We consider this to be a necessary precaution when dealing with user-generated svg's.

Sketchily requires a unique `id` (by default, this is set in the same way as hidden_field) each time it is called in the same page.
However, some uses of `form_for` can generate repeated ids (e.g. multiple `form_for @my_object.new` in the same page).
In those cases, you need to generate and specify your own unique ids. A possible solution is to use one of the many uuid generator gems.

It is recommended that the database entries associated with sketchily form elements be of type `text`.

The following examples assume that the database table for `@my_object` has a `sketch` column of type `text`.

Example usage (haml):

```haml
= form_for @my_object do |f|
  = f.sketchily :sketch, :hide_menu => true
```

### `sketchily_show` helper

- This function takes the base64-encoded SVG string as an argument and an options hash.
- The SVG string can be directly read from the field used by the `sketchily` and `sketchily_tag` functions.

Currently available options are:

- `width` width of resulting image object
- `height` height of resulting image object

- `bkgd_color` background color (3 or 6 hex digit html color format)
- `bkgd_file` background image file path (must be a local image file)

Passing only one of those options should keep the aspect ratio of the SVG constant in most browsers.

Example usage (haml):

```haml
= sketchily_show @my_object.sketch, :width => "500"
```

## Browser Support

Although more testing is needed, we currently believe sketchily supports any browsers that svg-edit 2.6 supports, namely:

- Firefox 1.5+
- Opera 9.50+
- Safari 4+
- Chrome 1+
- IE 9+
- IE 6+ (with the [Chrome Frame plugin](http://www.google.com/chromeframe)) 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create specs for your feature
4. Ensure that all specs pass
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new pull request
