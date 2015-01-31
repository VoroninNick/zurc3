unless RakeSettings.self_skip_initializers?
  ActiveAdmin.register ArticleAd do
    menu label: "ArticleAds"


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

    form do |f|
      f.inputs do
        f.translate_inputs do |t|
          t.input :custom_title
        end

        # f.inputs "Article", for: [:article, f.object.image] do |af|
        #   #ff.input :file, as: :file
        #
        #   af.input :file, :as => :file, :hint => af.object.file.present? \
        # ? link_to(image_tag(af.object.icon_url, class: "file-icon-img"), af.object.file.url)
        #                 : content_tag(:span, "Ще немає жодного прикріпленого файлу")
        #   af.input :file_cache, :as => :hidden
        # end

        #f.input as: :selection, collection: Article.all.map{|a| a.name }

      end

      f.actions
    end


  end
end