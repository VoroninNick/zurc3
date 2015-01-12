require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Zurc
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.i18n.available_locales = [:uk, :en]
    config.i18n.default_locale = :uk

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]

    config.before_configuration do
      I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
      I18n.default_locale = :en
      I18n.reload!
    end
  end
end
# VoroninNick
# (050) 417-07-28

# i just was searching work via google on ROR developer vacancy

# I live in Lviv, Ukraine. I am 23 years old.
# Currently I'm working in small company.  80% of my work is to make webpages which I receive from designer (HTML5, CSS3, JS).
#
# I am working with ROR about 1.5 years. I want to work more with Rails. And i'm looking for team  of developers to work together with them.
#                        Technologies.  Ajax, Devise, Slim, Sass, jquery, RailsAdmin, ActiveAdmin,
#
#                                                                                                                                      voroninstudio.eu


# Павел, 23 года.
#     На данный момент работаю в дизайн-студии. http://voroninstudio.eu
#
# Имею опыт с ROR уже более 1.5 лет.
#     С английским тоже проблем нет: могу переписываться, быстро читать книги, писать документацию и т.п.
#
#                                                                                                        Ранее пробовал себя в C#, ADO.NET, немного дописывал сайт  на PHP фреймворке OpenCart.
#
# Сейчас 80% моей работы составляет верстка. Хотел бы больше переходить в сторону бекэнда. (Хотя сам полностью делаю сайты, но это в основном либо каталог простой либо небольшой интернет магазин). Хотелось бы участвовать в каком то классном опен-сорс проекте. С огромным желанием разбираюсь в чем-то новом. На фирме, где я работаю, кроме меня есть только 1 программист. Поэтому не от кого чегонибудь научиться, да и проекты простые, в плане бекенда не разгонишься.