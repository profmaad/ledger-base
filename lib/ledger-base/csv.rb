require 'csv'

require_relative 'config'

module LedgerBase
  module CSV
    TAG_KEY_VALUE_REGEXP = /^[[:blank:]]*(?<key>[[:graph:]]*?): (?<value>[[:print:]]*)[[:blank:]]*$/
    TAG_REGEXP = /^[[:blank:]]*:(?<tag>[[:graph:]]*?):[[:blank:]]*$/

    CSV_OPTIONS = {
      :col_sep => ',',
      :row_sep => :auto,
      :quote_char => '"',
      :headers => false,  
    }

    def self.parse_metadata_tags(comment_string)
      tags = {}

      lines = comment_string.split('\n')

      lines.each do |line|
        key_value_match_data = TAG_KEY_VALUE_REGEXP.match(line)
        tag_match_data = TAG_REGEXP.match(line)

        if(key_value_match_data)
          tags[key_value_match_data[:key]] = key_value_match_data[:value]
        elsif(tag_match_data)
          tags[tag_match_data[:tag]] = true
        end
      end

      return tags
    end

    def self.parse_csv(csv_string)
      positions = []

      CSV.parse(csv_string) do |row|
        positions << {
          :posting_date => row[0],
          :clearing_date => row[1],
          :payee => row[2],
          :account => row[3],
          :currency => row[4],
          :amount => row[5].to_f,
          :cleared => row[6] == '*',
          :comment => row[7],
          :tags => parse_metadata_tags(row[7]),
        }
      end

      return positions
    end
  end
end
