module Vs
  class DynamicRouter
    def self.load_example
      Rails.application.class.routes.draw do
        Page.all.each do |page|
          #puts "Routing #{pg.name}"
          to = 'pages#show'
          if (page.controller && page.controller.length > 0) && (page.action && page.action.length > 0)
            to = "#{page.controller}##{page.action}"
          end

          page.translations_by_locale.keys.each do |locale|
            I18n.with_locale locale do
              get page.path, :to => to, defaults: { page_id: page.id, locale: locale }
            end
          end

        end
      end

      #if Configuration.settings_hash["detect_locale_automatically"] == 'true'

      #end
    end

    def self.load
      #if ActiveRecord::Base.connection.tables.include?(:routes)
        route_model = Vs::Route rescue nil
        available_locales_for_routes = I18n.available_locales
        if route_model && route_model.table_exists?
          Rails.application.class.routes.draw do
            route_model.all.each do |route|
              #define_method "ApplicationHelper.#{route.route_name}" do

              #end

              rb_code = "def #{route.route_name}_path( options = {})" +'options[:locale] = I18n.locale if !options.include? :locale; '+'send( "#{I18n.locale}_' + "#{route.route_name}_path" +'", options ); end'

              #match 'photos/:id' => 'photos#show', :constraints => { :id => /[A-Z]\d{5}/ }

              Rails.application.routes.url_helpers.module_eval rb_code
              #ApplicationHelper.module_eval rb_code

              route.translations_by_locale.select{|key| available_locales_for_routes.include?(key.to_sym) }.each_pair do |locale, route_translation|
                to = route.controller_action

                if !to || (to.respond_to?(:length) && to.length == 0) || !to.match(/^\w{1,}#\w{1,}$/)
                  to = redirect(route_translation.redirect_to_url)
                end

                route_string_starts_with_slash = route_translation.route_string.scan(/^\//).count > 0

                match "(/:locale)#{'/' if !route_string_starts_with_slash}#{route_translation.route_string}", to: to, as: "#{locale}_#{route.route_name}", via: route.method_list, constraints: { locale: /[a-zA-Z]{2,2}/ }, defaults: { predefined_locale: locale.to_s, route_id: route.id, route_locale: locale.to_s, route_name: route.route_name }
              end
            end
          end
        end
      #end
    end

    def self.reload
      Rails.application.class.routes_reloader.reload!
    end
  end
end