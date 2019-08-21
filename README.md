Workarea Super Hero
================================================================================

>Give your content super powers!

Super Hero plugin for the Workarea platform.

Configuring Super Hero for your app
--------------------------------------------------------------------------------

Superhero implements a content block type which no longer requires any initial
configuration. You may wish to override the config for the block type in order
to change the preset colors for background and text color pickers.

What Super Hero Does
--------------------------------------------------------------------------------
Super hero provides a fleshed out set of content tools that allows admin users to deliver beautiful content easily.

## Media Modes

Media Modes offers a set of options that dictate how media will be rendered

### Resize mode

Stretches/squishes media to fit the viewport or container.

automatically deteects and retains the aspect ratio of the chosen media

### Crop Mode

Allows the admin to select a 'crop to' location (left, center, right)

The image will maintain it's original height and crop to the designated location as the browser is resized

### Switch Mode

Allows the user to select up to 3 images which are rendered as a <picture> element

### Video Mode

Provides the Admin user with a text area input to paste in a full embed code from Vimeo or Youtube

The full iframe embed code must be provided, this will be parsed in the view model and constructed into a responsive iframe on the store front.

## Color Pickers

Super hero provides a full color picker for both text and background colors. Brand colors can be configured on a per-installation basis inside the super_hero_tasks.rake file.

The background color picker also provides a range slider and text input to control opacity. This accepts values between 0 - 100 and is converted to an alpha channel in the view model.

>Currently browser support for input type='color' is patchy, a polyfill is in the works to allow users on unsupported browsers to use this functionality.

## Content Positioning

The admin user is able to select from 9 content positions using a sweet SVG UI element. By default a position offset of 5% is defined, you can override the $positioning-offset scss variable in your host application to customize the space between content and the edge of the block.


Video Embedder
--------------------------------------------------------------------------------

Super hero includes a VideoEmbedder service which parses youtube and vimeo iframes
and generates iframe parameters.
The embedder accepts the iframe embed code and a set of options.
Options are part of the advanced_video Content::Field and include: loop, autoplay,
and mute functionality.

The plugin also includes js player API integrations for youtube and vimeo.
This enables the mute functionality and fires events to Workarea analytics.js.
In order to use those analytics events in your host application you will need
to write analytics adapter callbacks for the service you wish to send the data to.

Example callbacks:
```
'vimeo': function (payload) {
    send('send', payload.eventCategory, payload.eventAction, payload.eventLabel, payload.eventValue);
},

'youtube': function (payload) {
    send('send', payload.eventCategory, payload.eventAction, payload.eventLabel, payload.eventValue);
},
```

Getting Started
--------------------------------------------------------------------------------

This gem contains a rails engine that must be mounted onto a host Rails application.

You must have access to a WebLinc gems server to use this gem. Add your gems server credentials to Bundler:

    bundle config gems.weblinc.com my_username:my_password

Or set the appropriate environment variable in a shell startup file:

    export BUNDLE_GEMS__WEBLINC__COM='my_username:my_password'

Then add the gem to your application's Gemfile specifying the source:

    # ...
    gem 'workarea-super_hero', source: 'https://gems.weblinc.com'
    # ...

Or use a source block:

    # ...
    source 'https://gems.weblinc.com' do
      gem 'workarea-super_hero'
    end
    # ...

Update your application's bundle.

    cd path/to/application
    bundle

Copyright & Licensing
--------------------------------------------------------------------------------

Copyright WebLinc 2015. All rights reserved.

For licensing, contact sales@workarea.com.
