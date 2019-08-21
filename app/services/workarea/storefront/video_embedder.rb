module Workarea
  module Storefront
    class VideoEmbedder
      def initialize(embed_code, options = {})
        @embed_code = Nokogiri::HTML.fragment(embed_code).children.first
        @options = options
      end

      def iframe_attrs
        attrs = {
          frameborder: '0',
          allowfullscreen: '',
          container_style: "padding-bottom: #{aspect_ratio}%"
        }

        service_embed_code = if vimeo?
          Vimeo.new(@embed_code, @options)
        elsif youtube?
          Youtube.new(@embed_code, @options)
        end

        attrs.merge(service_embed_code.attrs)
      end

      def vimeo?
        host =~ /vimeo/ ? true : false
      end

      def youtube?
        host =~ /youtube/ ? true : false
      end

      private

        def url
          @url ||= @embed_code.attribute('src').value
        end

        def uri
          URI.parse(url)
        end

        def host
          uri.host
        end

        def aspect_ratio
          height = @embed_code.attribute('height').value
          width = @embed_code.attribute('width').value
          ratio = height.to_f / width.to_f
          ratio * 100
        end

        def parse_vimeo_id
          @embed_code.attribute('id').value
        end
    end
  end
end
