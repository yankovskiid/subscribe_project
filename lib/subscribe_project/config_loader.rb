require 'yaml'

module SubscribeProject
  module ConfigLoader
    def self.load_config
      env = ENV['SUBSCRIBE_PROJECT_ENV'] || 'development'
      @config ||= YAML.load_file(
        File.join(__dir__, '..', '..', 'config', 'config.yml'),
        aliases: true
      )[env]
    end
  end
end
