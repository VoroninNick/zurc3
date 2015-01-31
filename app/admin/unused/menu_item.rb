
  unless RakeSettings.self_skip_initializers?
    begin
      ActiveAdmin.register Vs::MenuItem do
        menu false

        # See permitted parameters documentation:
        # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
        #
        # permit_params :list, :of, :attributes, :on, :model
        #
        # or
        #
        # permit_params do
        #   permitted = [:permitted, :attributes]
        #   permitted << :other if resource.something?
        #   permitted
        # end

        sortable tree: true

        index :as => :sortable do
          label proc {|item| raw "<a class=\"hello\" href=\"#\">#{item.title || item.link_source}</a>" } # item content
          actions
        end

        form do |f|
          f.inputs do

            f.input :linkable, as: :select, collection: proc { f.linkable }, include_blank: false

            f.input :linkable_type, as: :hidden

            f.input :link_source, as: :radio, collection: [
                                    ["url", "url", { :"data-show-selector" => "#vs_menu_item_link_source_input + .activeadmin-translate", :"data-hide-selector" => "" }],
                                    ["association", "association", { :"data-show-selector" => "", :"data-hide-selector" => "#vs_menu_item_link_source_input + .activeadmin-translate" } ]]
            f.translate_inputs :url_translate_inputs do |t|
              t.input :url
            end



            f.input :title_source, as: :radio, collection: [
                                     ["title", "title", { :"data-show-selector" => "#vs_menu_item_title_source_input + .activeadmin-translate", :"data-hide-selector" => "" }],
                                     ["association", "association", { :"data-show-selector" => "", :"data-hide-selector" => "#vs_menu_item_title_source_input + .activeadmin-translate" }] ] do |i|
              if !i
                html checked: "checked"
              end
            end
            f.translate_inputs do |t|
              t.input :title
            end
          end
          f.actions
        end


      end
    end
  end