require 'generators/batman/common'
module Batman
  module Generators
    class ViewGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      def create_batman_controller
        with_app_name do
          template "views/index.html", "#{js_path}/views/#{plural_name.downcase}/index.html"
          template "views/show.html", "#{js_path}/views/#{plural_name.downcase}/show.html"
          template "views/_model.html", "#{js_path}/views/#{plural_name.downcase}/_#{singular_name.downcase}.html"
        end
      end
    end
  end
end
