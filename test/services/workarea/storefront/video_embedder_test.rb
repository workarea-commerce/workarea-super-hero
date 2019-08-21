require 'test_helper'

module Workarea
  module Storefront
    class VideoEmbedderTest < Workarea::SystemTest
      setup :embed_codes
      setup :options

      def embed_codes
        @vimeo_embed = '<iframe src="https://player.vimeo.com/video/153825647" width="1367" height="769" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
        @youtube_embed = '<iframe width="560" height="315" src="https://www.youtube.com/embed/rSGnNMnvM6M" frameborder="0" allowfullscreen></iframe>'
      end

      def options
        @options = { autoplay: true, loop_playback: true }
      end

      def test_frame_attrs_converts_vimeo_embed_code_to_attribute_hash
        view_model = Storefront::VideoEmbedder.new(@vimeo_embed, options)

        assert view_model.iframe_attrs[:src], 'https://player.vimeo.com/video/153825647?api=1&autoplay=true&loop=true&player_id=153825647'
        assert view_model.iframe_attrs[:frameborder], '0'
        assert view_model.iframe_attrs[:allowfullscreen], ''
        assert view_model.iframe_attrs[:webkitallowfullscreen], ''
        assert view_model.iframe_attrs[:mozallowfullscreen], ''
        assert view_model.iframe_attrs[:container_style], 'padding-bottom: 56.2545720555962%'
        assert view_model.iframe_attrs[:id], '153825647'
      end

      def test_frame_attrs_converts_youtube_embed_code_to_attribute_hash
        view_model = Storefront::VideoEmbedder.new(@youtube_embed, options)

        assert view_model.iframe_attrs[:src], 'https://www.youtube.com/embed/rSGnNMnvM6M'
        assert view_model.iframe_attrs[:frameborder], '0'
        assert view_model.iframe_attrs[:allowfullscreen], ''
        assert view_model.iframe_attrs[:container_style], 'padding-bottom: 56.25%'
      end

      def test_is_vimeo_returns_true_if_the_url_host_is_vimeo
        view_model = Storefront::VideoEmbedder.new(@vimeo_embed, options)

        assert view_model.vimeo?
      end

      def test_is_youtube_returns_true_if_the_url_host_is_youtube
        view_model = Storefront::VideoEmbedder.new(@youtube_embed, options)

        assert view_model.youtube?
      end
    end
  end
end
