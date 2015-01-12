module ActiveAdmin
  module Views
    module Pages
      class Base < Arbre::HTML::Document
        # def build_active_admin_head
        #   @head = head html: {class: 'locale'} do
        #       insert_tag Arbre::HTML::Title, [title, render_or_call_method_or_proc_on(self, active_admin_namespace.site_title)].compact.join(" | ")
        #       active_admin_application.stylesheets.each do |style, options|
        #         text_node stylesheet_link_tag(style, options).html_safe
        #       end
        #
        #       active_admin_application.javascripts.each do |path|
        #         text_node(javascript_include_tag(path))
        #       end
        #
        #       if active_admin_namespace.favicon
        #         text_node(favicon_link_tag(active_admin_namespace.favicon))
        #       end
        #
        #       text_node csrf_meta_tag
        #
        #   end
        # end

        def add_classes_to_body
          @body.add_class(params[:action])
          @body.add_class(params[:controller].tr('/', '_'))
          @body.add_class("active_admin")
          @body.add_class("logged_in")
          @body.add_class(active_admin_namespace.name.to_s + "_namespace")
          @body.add_class(  "locale-#{I18n.locale}" )
        end
      end
    end
  end
end