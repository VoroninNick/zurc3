ActiveAdmin.register ArticleAd do
  menu label: "Статті_Реклама"

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

  form html: { style: "display: block !important;" } do |f|
    f.inputs do
      f.input :article, as: :select, collection: Article.all

      f.input :title_source, as: :radio, collection: [
         ["title", "title", { :"data-show-selector" => "#article_ad_title_source_input + .activeadmin-translate", :"data-hide-selector" => "" }],
         ["association", "association", { :"data-show-selector" => "", :"data-hide-selector" => "#article_ad_title_source_input + .activeadmin-translate", checked: (f.object.title_source.blank?) ?  true : f.object.title_source == "association"  }] ]

      f.translate_inputs do |t|
        t.input :custom_title
      end

      f.input :release_date_source, as: :radio, collection: [
         ["title", "title", { :"data-show-selector" => "#article_ad_custom_release_date_input", :"data-hide-selector" => "" }],
         ["association", "association", { :"data-show-selector" => "", :"data-hide-selector" => "#article_ad_custom_release_date_input", checked: (f.object.release_date_source.blank?) ?  true : f.object.release_date_source == "association"  }] ]

      f.input :custom_release_date#, as: :datetime

      f.input :image_source, as: :radio, collection: [
          ["title", "title", { :"data-show-selector" => "#custom_image_inputs", :"data-hide-selector" => "" }],
          ["association", "association", { :"data-show-selector" => "", :"data-hide-selector" => "#custom_image_inputs", checked: (f.object.image_source.blank?) ?  true : f.object.image_source == "association"  }] ]

      #f.inputs "Article"

      # f.inputs "Article", for: [:article, f.object.image] do |af|
      #   #ff.input :file, as: :file
      #
      # #   af.input :file, :as => :file, :hint => af.object.file.present? \
      # # ? link_to(image_tag(af.object.icon_url, class: "file-icon-img"), af.object.file.url)
      # #                 : content_tag(:span, "Ще немає жодного прикріпленого файлу")
      # #   af.input :file_cache, :as => :hidden
      # end

      #f.input as: :selection, collection: Article.all.map{|a| a.name }

    end



    f.inputs "Custom image", for: [:article_image, f.object.custom_image || Assets::Image.new], id: "custom_image_inputs" do |ff|
      #ff.input :file, as: :file

      ff.input :file, :as => :file, :hint => ff.object.file.present? \
      ? link_to(image_tag(ff.object.icon_url, class: "file-icon-img"), ff.object.file.url)
                      : content_tag(:span, "Ще немає жодного прикріпленого файлу")
        ff.input :file_cache, :as => :hidden


    end

    f.actions
  end


end
