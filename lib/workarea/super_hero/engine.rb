module Workarea
  module SuperHero
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::SuperHero
    end
  end
end
