module Workarea
  module Storefront
    module ContentBlocks
      class SuperHeroViewModel < ContentBlockViewModel
        def image_medium_url
          if data[:asset_medium].present?
            find_asset(data[:asset_medium]).url
          else
            image.url
          end
        end

        def image_small_url
          if data[:asset_small].present?
            find_asset(data[:asset_small]).url
          else
            image.url
          end
        end

        def breakpoints
          Workarea.config.storefront_break_points
        end

        def image
          @image ||= find_asset(data[:asset])
        end

        def alt_text
          model.data[:alt_text].presence
        end

        def media_class
          if model.data[:media_mode] == 'crop'
            "crop super-hero-content-block__media--crop-#{model.data[:crop_side]}"
          else
            model.data[:media_mode]
          end
        end

        def media_styles
          if model.data[:media_mode] == 'resize'
            "padding-bottom: #{image.file_inverse_aspect_ratio * 100}%"
          elsif model.data[:media_mode] == 'crop'
            "padding-bottom: #{image.height}px"
          end
        end

        def video_iframe_attrs
          return unless model.data[:video].present?
          embed_code = VideoEmbedder.new(
            model.data[:video],
            autoplay: model.data[:autoplay],
            loop_playback: model.data[:loop],
            mute: model.data[:mute]
          )
          embed_code.iframe_attrs
        end

        def content_class
          content_class = 'content-position '
          model.data[:content_position].split(',').each do |pos|
            content_class << "content-position--#{pos.optionize} "
          end
          return content_class
        end

        def content_styles
          background_color = ColorTools.new(
            hex: model.data[:background_color],
            alpha: model.data[:background_alpha]
          )

          "color: #{model.data[:text_color]}; background-color: rgba(#{background_color.rgba});"
        end
      end
    end
  end
end
