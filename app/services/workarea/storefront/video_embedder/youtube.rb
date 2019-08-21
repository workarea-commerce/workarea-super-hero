module Workarea
  module Storefront
    class VideoEmbedder
      class Youtube
        def initialize(embed_code, options = {})
          @embed_code = embed_code
          @options = options
        end

        def attrs
          {
            id: "youtube-#{youtube_id}",
            src: "#{url}?#{url_params}",
            data: {
              youtube_api: {
                mute: @options[:mute]
              }.to_json
            }
          }
        end

        def url_params
          parsed_query = Rack::Utils.parse_query(uri.query)
          parsed_query['enablejsapi'] = 1
          parsed_query['autoplay'] = autoplay
          parsed_query['loop'] = loop_playback
          parsed_query['videoId'] = youtube_id

          URI.encode_www_form(parsed_query)
        end

        private

          def youtube_id
            uri.path.split('/').last
          end

          def autoplay
            @options[:autoplay] ? 1 : 0
          end

          def loop_playback
            @options[:loop_playback] ? 1 : 0
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
