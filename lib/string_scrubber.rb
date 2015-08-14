require 'string_scrubber/version'
require 'string-scrub' unless String.respond_to?(:scrub!)

module StringScrubber
  def to_json(options = nil)
    self.force_encoding('UTF-8') unless self.encoding == Encoding::UTF_8
    self.scrub! unless self.valid_encoding?
    super(options)
  end
end

String.send :prepend, StringScrubber
