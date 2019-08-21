module Workarea
  module Storefront
    class ColorTools
      def initialize(color)
        @color = color
      end

      def rgba
        if @color[:hex] =~ /#(..)(..)(..)/
          "#{hex_to_rgb}, #{alpha}"
        end
      end

      def alpha
        @color[:alpha].to_f / 100.0
      end

      def hex_to_rgb
        r, g, b = @color[:hex].match(/#(..)(..)(..)/).captures
        "#{r.hex}, #{g.hex}, #{b.hex}"
      end
    end
  end
end
