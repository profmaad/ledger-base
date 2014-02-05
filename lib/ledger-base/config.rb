require 'deep_merge'
require 'yaml'

module LedgerBase
  class Config
    DEFAULTS = {
      ledger: {
        binary: 'ledger',
        file: nil,
        currencies: {
          BTC: 'BTC',
          USD: 'USD'
        },
      },
    }

    class << self
      def init(config_file)
        @@instance = Config.new(config_file)
      end
      
      def instance
        @@instance ||= Config.new(nil)
        
        return @@instance
      end

      def [](element)
        return instance[element]
      end
      def []=(element, value)
        instance[element] = value
      end

      def currency_symbol(currency_code)
        return instance.currency_symbol(currency_code)
      end
    end

    def initialize(config_file)
      @config = DEFAULTS
      @config.deep_merge!(parse_config_file(File.expand_path(config_file))) unless config_file.nil?
    end
    
    def [](element)
      @config[element]
    end
    def []=(element, value)
      @config[element] = value
    end

    def currency_symbol(currency_code)
      if(@config[:ledger][:currencies][currency_code])
        return @config[:ledger][:currencies][currency_code]
      else
        return currency_code.to_s.upcase
      end
    end

    private
    def parse_config_file(config_file)
      config = {}
      begin
        config = YAML.load_file(config_file)
      rescue => e
        $stderr.puts "Failed to parse config file at '#{config_file}': " << e.to_s
      end

      deep_symbolize_hash_keys(config)
    end

    def deep_symbolize_hash_keys(hash)
      return hash unless hash.is_a?(Hash)

      result = {}
      
      hash.each do |key, value|
        result[key.to_sym] = deep_symbolize_hash_keys(value)
      end

      result
    end
  end
end
