module Workarea
  should_append_range_module = proc do
    if Plugin.javascripts_appends['admin.modules'].nil?
      true
    else
      Plugin.javascripts_appends['admin.modules'].none? { |append| %r{/modules/range_fields} =~ append }
    end
  end

  should_append_video_api_modules = proc do
    if Plugin.javascripts_appends['storefront.modules'].nil?
      true
    else
      Plugin.javascripts_appends['storefront.modules'].none? { |append| %r{/modules/youtube_api} =~ append }
    end
  end

  Plugin.append_stylesheets(
    'admin.components',
    'workarea/admin/super_hero/components/position_grid'
  )

  Plugin.append_javascripts(
    'admin.modules',
    'workarea/admin/super_hero/modules/media_modes',
    'workarea/admin/super_hero/modules/position_input'
  )

  Plugin.append_stylesheets(
    'storefront.components',
    'workarea/storefront/super_hero/components/super_hero_content_block',
    'workarea/storefront/super_hero/components/content_position'
  )

  if should_append_video_api_modules.call
    Plugin.append_javascripts(
      'storefront.modules',
      'workarea/storefront/super_hero/modules/youtube_api',
      'workarea/storefront/super_hero/modules/vimeo_api'
    )
  end
end
