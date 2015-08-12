require 'string_scrubber/version'
require 'string-scrub' if RUBY_VERSION[/^2\.0/]

module StringScrubber
  def to_json(options = nil)
    self.force_encoding('UTF-8') unless self.encoding == Encoding::UTF_8
    self.scrub! unless self.valid_encoding?
    super(options)
  end
end

if RUBY_VERSION[/^2\.0/].nil?
  String.prepend(StringScrubber)
else
  String.send :prepend, StringScrubber
end
