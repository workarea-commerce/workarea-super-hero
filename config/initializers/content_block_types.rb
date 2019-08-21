Workarea::Content.define_block_types do
  find_asset_id = lambda do |name|
    proc do
      asset = Workarea::Content::Asset.where(file_name: name).first ||
                Workarea::Content::Asset.placeholder

      asset.try(:id)
    end
  end

  block_type 'Super Hero' do
    description 'Text over a background image. Text may be positioned and may contain a link.'
    view_model 'Workarea::Storefront::ContentBlocks::SuperHeroViewModel'

    fieldset 'Media' do
      field 'Media Mode', :media_mode, default: 'crop'
      field 'Asset', :asset, required: true, file_types: 'image', default: find_asset_id.call('960x470_light.png'), html_data_attributes: { media_mode: ['resize', 'crop', 'switch'] }
      field 'Asset Medium', :asset, file_types: 'image', default: find_asset_id.call('960x470_light.png'), html_data_attributes: { media_mode: ['switch'] }
      field 'Asset Small', :asset, file_types: 'image', default: find_asset_id.call('960x470_light.png'), html_data_attributes: { media_mode: ['switch'] }
      field 'Alt Text', :string, default: 'An Image', placeholder: 'A description of the image', html_data_attributes: { media_mode: ['switch'] }
      field 'Video', :video_advanced, html_data_attributes: { media_mode: ['video'] }
      field 'Crop Side', :options, values: ['left', 'center', 'right'], default: 'Center', html_data_attributes: { media_mode: ['crop'] }
    end

    fieldset 'Content' do
      field 'Content', :text, default: "<h2>Text</h2><p>#{Workarea.config.placeholder_text}</p>"
      field 'Text Color', :color, default: '#000000', presets: ['#000000', '#ffffff', '#999999', '#ff0000', '#00ff00', '#0000ff']
      field 'Background Color', :color, default: '#ffffff', presets: ['#000000', '#ffffff', '#999999', '#ff0000', '#00ff00', '#0000ff']
      field 'Background Alpha', :range, default: '50', min: 0, max: 100, step: 1
      field 'Content Position', :options, values: [
        'Top, Left',
        'Top, Center',
        'Top, Right',
        'Middle, Left',
        'Middle, Center',
        'Middle, Right',
        'Bottom, Left',
        'Bottom, Center',
        'Bottom, Right'
      ], default: 'Middle, Center'
    end

    fieldset 'CTA' do
      field 'Link', :url, default: '/'
      field 'Link Text', :string, default: 'Click Me!'
      field 'Link Style', :options, values: ['button', 'text-button', 'link'], default: 'button'
    end
  end
end
