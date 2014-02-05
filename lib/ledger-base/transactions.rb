require_relative 'command'
require_relative 'csv_parser'

module LedgerBase
  module Transactions
    def self.last_matching_transaction(query, ledger_file = nil)
      csv_result = %x(#{LedgerBase::Command.ledger_base_command(ledger_file)} -S date --last 1 csv #{query})

      return LedgerBase::CSVParser.parse_csv(csv_result)
    end
  end
end
