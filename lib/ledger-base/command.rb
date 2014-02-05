require_relative 'config'

module LedgerBase
  module Command
    def self.ledger_base_command(ledger_file)
      command = LedgerBase::Config[:ledger][:binary]
      
      if(ledger_file)
        command << " --file #{ledger_file}"
      elsif(not(LedgerBase::Config[:ledger][:file].nil? or LedgerBase::Config[:ledger][:file].empty?))
        command << " --file #{LEDGER_FILE}"
      end
      
      return command
    end      
  end
end
