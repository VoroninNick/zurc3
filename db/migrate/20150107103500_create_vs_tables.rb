class CreateVsTables < ActiveRecord::Migration
  def data
    #if direction == :up
    #route_model = Vs::Route
    get 'contact', to: 'contact#index', as: :contact

    get "news/list", to: 'news#list', as: :news_list
    get "news/:id", to: 'news#view', as: :news_view
    get "publications", to: 'publication#list', as: 'publication_list'
    get "publications/:id", to: 'publication#view', as: :publication_view
    #get "contact", to:'contact', as: 'contact'
    get "about", to: 'page#about', as: 'about'
    get "what-we-do", to: 'page#what_we_do', as: 'what_we_do'
    #end
  end

  def up
    # ============================================
    # --------------------------------------------
    # CreateVoroninStudioPageMetadata
    # --------------------------------------------
    # ============================================


    page_metadata_table_name = :page_metadata
    create_table page_metadata_table_name do |t|
      t.string :head_title
      t.text :meta_tags
      t.text :meta_description

      # columns for belongs_to :page, polymorphic: true
      t.integer :page_id
      t.string :page_type
      t.timestamps
    end

    model_page_metadata = Vs::PageMetadata

    model_page_metadata.create_translation_table!({head_title: :string, meta_tags: :text, meta_description: :text })

    # ============================================
    # --------------------------------------------
    # CreateVoroninStudioRoutes
    # --------------------------------------------
    # ============================================

    route_table_name = :routes

    create_table route_table_name do |t|
      t.string :name
      t.string :route_string
      t.string :route_name
      t.string :controller_action
      t.string :redirect_to_url
      t.integer :position
      t.string :methods

      t.timestamps
    end

    route_model = Vs::Route

    add_index route_table_name, :position

    route_model.create_translation_table!(route_string: :string, redirect_to_url: :string)
  end

  def down
    # ============================================
    # --------------------------------------------
    # CreateVoroninStudioPageMetadata
    # --------------------------------------------
    # ============================================

    model_page_metadata = Vs::PageMetadata
    drop_table model_page_metadata.table_name
    model_page_metadata.drop_translation_table!

    # ============================================
    # --------------------------------------------
    # CreateVoroninStudioRoutes
    # --------------------------------------------
    # ============================================

    route_model = Vs::Route

    remove_index route_model.table_name, :position

    drop_table route_model.table_name

    route_model.drop_translation_table!
  end
end
