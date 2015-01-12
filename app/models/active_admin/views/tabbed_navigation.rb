module ActiveAdmin
  module Views
    class TabbedNavigation
      def languages
        I18n.t("active_admin.translate.languages")
      end

      def build_menu_item(item)
        li id: item.id do |li|
          li.add_class "current" if item.current? assigns[:current_tab]

          text_node link_to item.label(self), item.url(self), item.html_options

          if children = item.items(self).presence
            li.add_class "has_nested"
            ul do
              children.each{ |child| build_menu_item child }
            end
          end
        end
      end

      I18n.available_locales.each_with_index do |locale, index|
        # define_method "#{locale}_language" do
        #
        # end


        class_eval do
          define_method "#{locale}_language" do
            I18n.t("active_admin.translate.#{locale}")
          end
        end
      end


    end
  end
end