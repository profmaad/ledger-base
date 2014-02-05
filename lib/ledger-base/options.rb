require 'trollop'

module LedgerBase
  module Options
    TROLLOP_PARSER = Trollop::Parser.new do
      opt :old_transactions, 'Include old (already imported) transactions in the output (also see \'ledger-file\' option)', short: 'o', default: false
      
      opt :config, 'Path to ledger-base config file', short: 'c', type: :string, default: '~/.ledgerrubyrc'

      opt :ledger_file, 'Path to ledger file to use for checking for already imported transactions (also see \'old-transactions\' option)', short: 'l', type: :string
    end

    def self.parse(argv)
      options = Trollop::with_standard_exception_handling(TROLLOP_PARSER) do
        TROLLOP_PARSER.parse(argv)
      end

      return [options, TROLLOP_PARSER.leftovers]
    end
  end
end
