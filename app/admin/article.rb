unless RakeSettings.self_skip_initializers?
  ActiveAdmin.register Article do


    # scopes

    [:publications, :news, :what_we_do, :about_us].each do |scope_name|
      scope scope_name do |s|
        Article.send(scope_name)
      end
    end


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

    index do
      column :name
      column :release_date
      column :article_category
      actions
    end

    form do |f|
      f.inputs do
        f.input :article_category, as: :select, collection: ArticleCategory.all
        #f.input :article_category, as: :select, collection: (  ;values = [1,2,3]; formatted_values = values.map {|v| "<option>#{v}</option>" }; formatted_values  )
        #f.input :article_category, as: :select, collection: option_groups_from_collection_for_select(ArticleCategory.roots, :children, :name, :id, :name)

        f.translate_inputs do |t|
          t.input :name
          t.input :slug
          t.input :short_description
          t.input :intro
          t.input :content, as: :ckeditor

          t.input :author
        end

        f.inputs "Avatar", for: [:image, f.object.image || Assets::Image.new] do |ff|
          ff.input :file, as: :file
        end

        #render "active_admin_multi_upload/upload_form", resource: f.object, association: "attachments", attribute: "file" , options: {  }

        #f.inputs "attachments", for: [:attachments, f.object.attachments || Assets::Attachment.new] do |ff|


        #  ff.input :file, as: :file
          #ff.translate_inputs do |t|
            #t.input :url
            #t.input :head_title
            #t.input :meta_description
            #t.input :meta_tags
          #end
        #end

        #f.has_many :attachments, :allow_destroy => true, :new_record => true do |cf|
          # if cf.object.file.file.exists?
          #   image_tag(cf.object.file.url(:thumb))
          # end
          # cf.input :file
        #end

        f.has_many :attachments, :allow_destroy => true, new_record: true do |af|
            af.input :file, :as => :file, :hint => af.object.file.present? \
    ? link_to(image_tag(af.object.icon_url, class: "file-icon-img"), af.object.file.url)
                               : content_tag(:span, "Ще немає жодного прикріпленого файлу")
            af.input :file_cache, :as => :hidden
        end



        f.input :release_date
      end

      # f.inputs do |f|
      #   render "active_admin_multi_upload/upload_form", resource: f.object, association: "attachments", attribute: "file" , options: {  }
      # end


      f.inputs "Page metadata", for: [:page_metadata, f.object.page_metadata || Vs::PageMetadata.new] do |ff|
        #ff.input :file, as: :file
        ff.translate_inputs do |t|
          t.input :head_title
          t.input :meta_description
          t.input :meta_tags
        end
      end


      f.actions
    end


  end
end