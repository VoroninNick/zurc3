class ActiveRecord::Migration
  def match *args
    route_model = Vs::Route

    options = args.extract_options!
    route_string = args.first
    methods = options[:via]
    methods_string = ""
    route_name = options[:as]
    controller_action = options[:to]
    if methods
      case methods.class
        when Array
          methods_string = methods.join(',')
        when String, Symbol
          methods_string = methods.to_s
      end
    end
    #r = Route.new(route_string: route_string, methods: methods_string )
    #rt = Route.translation_class.new(route:)
    r = route_model.new(route_name: route_name, name: route_name, controller_action: controller_action, methods: methods_string)


    I18n.available_locales.each do |locale|
      rt = route_model.translation_class.new(locale: locale.to_s, route_string: route_string)
      r.translations.push(rt)
    end

    #puts "route: \n#{r.inspect}"


    r.save
  end

  def get *args
    options = args.extract_options!
    options[:via] = :get
    params = args || []
    params.push(options)
    match *params
  end

  def post *args
    options = args.extract_options!
    options[:via] = :post
    params = args || []
    params.push(options)
    match *params
  end
end