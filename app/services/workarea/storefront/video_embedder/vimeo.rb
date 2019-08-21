module Workarea
  module Storefront
    class VideoEmbedder
      class Vimeo
        def initialize(embed_code, options = {})
          @embed_code = embed_code
          @options = options
        end

        def attrs
          {
            id: vimeo_id,
            src: "#{url}?#{url_params}",
            webkitallowfullscreen: '',
            mozallowfullscreen: '',
            data: {
              vimeo_api: {
                player_id: vimeo_id,
                mute: @options[:mute]
              }.to_json
            }
          }
        end

        def url_params
          parsed_query = Rack::Utils.parse_query(uri.query)
          parsed_query['api'] = 1
          parsed_query['autoplay'] = @options[:autoplay]
          parsed_query['loop'] = @options[:loop_playback]
          parsed_query['player_id'] = vimeo_id
          uri.query = URI.encode_www_form(parsed_query)
        end

        private

          def vimeo_id
            uri.path.split('/').last
          end

          def url
            @url ||= @embed_code.attribute('src').value
          end

          def uri
            URI.parse(url)
          end
      end
    end
  end
end
