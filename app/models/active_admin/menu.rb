file_path = [Gem.loaded_specs.select{|g| g == 'activeadmin'}.first.second.full_gem_path, 'lib', 'active_admin', 'menu'].join('/')

require file_path

module ActiveAdmin
  class Menu
    module MenuNode
      module_eval do
        def normalize_id(id)
          case id
            when String, Symbol, ActiveModel::Name, Proc
              id.to_s.downcase.tr ' ', '_'
            when ActiveAdmin::Resource::Name
              id.param_key
            else
              raise TypeError, "#{id.class} isn't supported as a Menu ID"
          end
        end
      end
    end
  end
end



# module ActiveAdmin::Menu::MenuNode
#   def normalize_id(id)
#     case id
#       when String, Symbol, ActiveModel::Name
#         id.to_s.downcase.tr ' ', '_'
#       when ActiveAdmin::Resource::Name
#         id.param_key
#       else
#         raise TypeError, "#{id.class} isn't supported as a Menu ID"
#     end
#   end
# end