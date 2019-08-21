require 'test_helper'

module Workarea
  module Storefront
    class ContentBlocks::SuperHeroViewModelTest < Workarea::SystemTest
      def test_locals_returns_additional_local_data_keys
        image = create_asset(name: 'Test Image', file_height: '400px', file_width: '400px')
        content = create_content
        block = content.blocks.create!(
          area: 'body',
          type_id: 'super_hero',
          data: {
            media_mode: 'crop',
            asset: image.id,
            video_embed: nil,
            crop_side: 'left',
            html: '<p>Test Content</p>',
            link_text: 'See My Super Powers',
            link_url: 'http://example.com',
            text_color: '#000000',
            background_color: '#ffffff',
            background_alpha: '50',
            content_position: 'Middle, Center',
            show_mobile: true
          }
        )

        view_model = Storefront::ContentBlocks::SuperHeroViewModel.new(block)
        assert_equal('crop super-hero-content-block__media--crop-left', view_model.media_class)
        assert_equal('content-position content-position--middle content-position--center ', view_model.content_class)
        assert_equal('color: #000000; background-color: rgba(255, 255, 255, 0.5);', view_model.content_styles)
        assert_nil(view_model.video_iframe_attrs)

        image.destroy
      end
    end
  end
end
