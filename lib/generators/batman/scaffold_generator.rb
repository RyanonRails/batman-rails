require 'generators/batman/common'
module Batman
  module Generators
    class ScaffoldGenerator < ::Rails::Generators::NamedBase
      include Common
      requires_app_name

      desc "This generator creates the client side CRUD scaffolding"

      def create_batman_model
        with_app_name do
          generate "batman:model #{singular_model_name} --app_name #{app_name}"
          generate "batman:controller #{singular_model_name} index new show create edit update destroy --app_name #{app_name}"
          generate "batman:helper #{singular_model_name}"
          generate "batman:view #{singular_model_name}"
        end
      end
    end
  end
end
