require 'test_helper'

module Workarea
  module Storefront
    class ColorToolsTest < Workarea::SystemTest
      def test_rgba_returns_an_equivalent_rgba_value
        color = Storefront::ColorTools.new(
          hex: '#ffffff',
          alpha: '50'
        )

        assert_equal('255, 255, 255, 0.5', color.rgba)
      end

      def test_alpha_converts_a_percentage_to_a_0_0_1_0_decimal
        color = Storefront::ColorTools.new(
          alpha: '75'
        )

        assert_equal(0.75, color.alpha)
      end

      def test_hex_to_rgb_converts_a_6_digit_hex_color_to_rgb
        color = Storefront::ColorTools.new(
          hex: '#ffffff'
        )

        assert_equal('255, 255, 255', color.hex_to_rgb)
      end
    end
  end
end
