module LedgerBase
  VERSION = [0,0,1]

  def self.version_string
    return VERSION.join('.')
  end
end
