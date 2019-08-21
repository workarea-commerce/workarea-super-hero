Workarea Super Hero 2.2.1 (2019-08-21)
--------------------------------------------------------------------------------

*   Open Source!



Workarea Super Hero 2.2.0 (2019-06-11)
--------------------------------------------------------------------------------

*   Make image clickable when link is present

    Uses the new link_to_if_with_block helper from Workarea v3.4 to make the background image clickable if a link URL is provided

    WLSUPERHRO-21
    Jake Beresford



Workarea Super Hero 2.1.1 (2018-10-02)
--------------------------------------------------------------------------------

*   Add alt text to super hero when using 'switch' media mode

    WLSUPERHRO-28
    Jake Beresford



Workarea Super Hero 2.1.0 (2018-05-31)
--------------------------------------------------------------------------------

*   Remove range field

    The Range field was added to the Workarea platform in v3.3, this functionality has been removed from super hero to prevent conflicts and ensure compatibility.

    WLSUPERHRO-26
    Jake Beresford



Workarea Super Hero 2.0.5 (2018-05-24)
--------------------------------------------------------------------------------

*   WLSUPERHRO-25: Add guard for if video APIs have already been added

    Steve Perks



Workarea Super Hero v2.0.4 (2018-02-12)
--------------------------------------------------------------------------------

*   Fix admin duplicate IDs in SVG icon

    Jake Beresford



Workarea Super Hero v2.0.3 (2018-02-08)
--------------------------------------------------------------------------------

*   Fix appends lambda

    Jake Beresford



Workarea Super Hero v2.0.2 (2018-01-11)
--------------------------------------------------------------------------------

*   Add missing methods to range.rb

    Jake Beresford

*   Add condition around range_field.js append

    This module is also defined in the slider_block plugin, causing an error if both plugins are loaded in a host application. This condition helps prevent JS errors in the admin due to registering 2 modules with the same name.

    WLSUPERHRO-22
    Jake Beresford

*   Add step attribute to range input

    * Update range input for compatibility with workarea-slider_block
    * Set default step value to 1, since we're dealing with % I doubt this will ever need to change

    WLSUPERHRO-22
    Jake Beresford



Workarea Super Hero v2.0.1 (2017-06-06)
--------------------------------------------------------------------------------

*   Updates for CI

    * Remove bundler gem tasks to prevent pushing to rubygems
    * Rubocop passing
    * add bundle-audit for CI
    Beresford, Jake



Workarea Super Hero v2.0.0 (2017-05-19)
--------------------------------------------------------------------------------

*   Fixes mute functionality for vimeo

    * Upgrade to the latest vimeo player API, remove froogaloop.
    * Fix vimeo event implementation
    * refactor video embedder nokogiri traversal
    * Fix some tests that were broken on another ticket
    * Move logic for adding video service api data binding into the video embedder.
    * Split video embedder logic by service
    * Request vimeo and youtube SDK as necessary using getScript
    * Implement youtube_api.js module
    * Move append points to initializer
    * Updated readme

    WLSUPERHRO-15
    Beresford, Jake

*   Responsive images fall back to asset if undefined by admin user.

    * updated view_model syntax to be same as base content blocks

    WLSUPERHRO-17
    Beresford, Jake

*   Translate admin views

    WLSUPERHRO-16
    Dave Barnow

*   Upgrade plugin for v3 compatability

    Many things were changed to get this working, however
    functionality is almost identical to v2. Key changes:

    * Re-write blocktype using DSL
    * Re-name workarea & storefront
    * Asset lookup for size & ratio removed, use base asset lookup
    * Removed color input styles, use base color input
    * Tests converted to minitest

    WLSUPERHRO-14
    Beresford, Jake



Workarea Super Hero v1.0.7 (2016-12-15)
--------------------------------------------------------------------------------

*   WLSUPERHRO-13: Add require version file to super_hero.rb add metadata to gemspec

    Beresford, Jake



Workarea Super Hero v1.0.6 (2016-07-20)
--------------------------------------------------------------------------------

*   WLSUPERHRO-10: Adds another blank line for code style

    Dave Barnow

*   WLSUPERHRO-10: Adds back in blank lines to conform to cssguidelin.es

    Dave Barnow

*   WLSUPERHRO-10: Fixes center positioning, readme markdown formatting

    Dave Barnow



Workarea Super Hero v1.0.5 (2016-06-30)
--------------------------------------------------------------------------------

*   WLSUPERHRO-9: Adds preset for media to prevent admin errors

    Beresford, Jake

*   WLSUPERHRO-9: Change logic when checking for embed codes to cover nil? and empty?

    Beresford, Jake



Workarea Super Hero v1.0.4 (2016-06-29)
--------------------------------------------------------------------------------

*   WLSUPERHRO-8: Fix range slider

    Beresford, Jake



Workarea Super Hero v1.0.3 (2016-06-15)
--------------------------------------------------------------------------------

*   WLSUPERHRO-7: Add test for youtube embed codes

    Beresford, Jake

*   WLSUPERHRO-7: change vimeo conditional to guard clause

    Beresford, Jake

*   WLSUPERHRO-7: return iframe attrs in video embedder to fix issue with youtube videos having nil attrs

    Beresford, Jake



Workarea Super Hero v1.0.1 (2016-05-31)
--------------------------------------------------------------------------------

*   WLSUPERHRO-6: Explicitly require froogaloop

    bberg



Workarea Super Hero v1.0.0 (2016-05-26)
--------------------------------------------------------------------------------

*   WLSUPERHRO-4: Remove logic for ga tracker detection

    Beresford, Jake

*   WLSUPERHRO-4: Fix pause event data and player_id

    Beresford, Jake

*   WLSUPERHRO-4: Add jsdoc comment

    Beresford, Jake

*   WLSUPERHRO-4: change implementation to use WEBLINC.analytics

    Beresford, Jake

*   WLSUPERHRO-4: Add vimeo event tracking for video interactions

    Beresford, Jake

*   WLSUPERHRO-4: move color and video embed classes out of view models and in to services, fix up tests accordingly

    Beresford, Jake

*   WLSUPERHRO-4: Fixes froogaloop integration, makes things work properly.

    Beresford, Jake

*   WLSUPERHRO-4: Adds vimeo api integration using froogaloop JS

    Beresford, Jake

*   WLSUPERHRO-2: Removes debugging statements and cleanup ruby style

    Beresford, Jake

*   WLSUPERHERO-2: Adds tests and refactor for video_embed_view_model

    Beresford, Jake

*   Complete color view model unit tests, refactor view model to remove args

    Beresford, Jake

*   WLSUPERHRO-2: Update spec tests, add tests for color view model

    Beresford, Jake

*   WLSUPERHRO-2: Break out color and video embed methods into classes, start writing unit tests

    Beresford, Jake

*   Update aspect ratio calculation, remove dummy hero image

    Beresford, Jake

*   Cleanup haml file dynamic classes and symbol syntax

    Beresford, Jake

*   Improve some JS logic, cleanup some sass spacing, get everything looking groovy

    Beresford, Jake

*   Decorate Content::Asset with dragonfly magic attributes, cleanup viewmodel and remove call to S3 for each view of the blocktype

    Beresford, Jake

*   Cleanup rake task and JS

    Beresford, Jake

*   Clean up the turtle's cape

    Beresford, Jake

*   Add necessary files for content block plugin

    Clean up the filez
    updates to view model and add range for bg alpha channel
    add basic styles, fixup the view model, add some sweet color pickers, add markup for responsive images and media modes
    Adds color picker styles, additional config options, position input SVG, SVg helper, media modes and toggle groups.
    Some fixes and placeholders and other things I needed to fix before the demo. Position input is a POS and doesnt work yet.
    Adds image attribute detection using dragonfly analysers
    Get the content position input working, rename some things, shuffle things about
    Simplify filename regex, remove extraneous styles
    Clean up content position styles
    Simplify content class in view model
    Pulls responsive images out of maintain aspect ratio, clen up the view model some more, rename some local_assigns
    Bring content area controls into admin view
    Modify media-mode groups to use array.includes to give more flexibility in the UI
    Get video embeds working for youtube and vimeo. Code needs TLC but it works for now.
    Fixes logic around video vs. image
    Clean up content position scss component
    Fixes nesting of position input
    Refactor content position logic and styles for less CSS
    Js changes to position input
    Remove use of this in js
    Clean up media_modes js
    Add lintier config dotfiles
    Remove generic content-block classes

    Beresford, Jake



