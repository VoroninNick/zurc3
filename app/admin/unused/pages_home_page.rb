unless RakeSettings.self_skip_initializers?
  begin
    ActiveAdmin.register Pages::HomePage do
      menu parent: proc { I18n.t("menu.labels.pages") }

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
        actions
      end

      form do |f|
        f.inputs do

          #f.inputs "Slider", for: [:slider, f.object.slider || PageBlocks::HomeSlider.new] do |ff|
            #ff.input :file, as: :file
            # ff.translate_inputs do |t|
            #   t.input :head_title
            #   t.input :meta_description
            #   t.input :meta_tags
            # end


          #end

          # slider = f.object.slider
          # slider = PageBlocks::HomeSlider.new if slider.nil?
          #
          # slider_url = slider.url_field
          # slider_url = ModelFields::StringModelField.new if slider_url.nil?
          #



        end

        div do
          #f.object.slider
        end

        # f.inputs "Slider",
        #          for: [
        #              :slider,
        #               f.object.slider #||
        #                           #PageBlocks::HomeSlider.new
        #          ] do |ff|
        #   #ff.input :data
        #   #ff.input :url_field
        #   #ff.input :id
        # end

        f.inputs "Slider", for: [ :slider, f.object.slider.first || PageBlocks::HomeSlider.new ] do |ff|
          #ff.input :data
          #ff.input :url_field
          #ff.input :id
        end

        f.actions
      end

    end
  rescue

  end
end