require 'spec_helper'
require 'json'

describe StringScrubber do

  it 'has a version number' do
    expect(StringScrubber::VERSION).not_to be nil
  end

  context 'valid UTF-8 encoding' do
    subject { "今日は" }

    it 'does not force re-encoding' do
      expect(subject).not_to receive(:force_encoding)
      subject.to_json
    end

    it 'does not get scrubbed' do
      expect(subject).not_to receive(:scrub!)
      subject.to_json
    end

    it 'converts without error' do
      expect(subject.to_json).to eq("\"今日は\"")
    end
  end

  context 'invalid encoding (ASCII-8BIT)'do
    # If you force-encode this to UTF-8 and then call the default #to_json on it, it will
    # throw a JSON::Generator error.
    subject { "\xE2".force_encoding('ASCII-8BIT') }

    it 'gets force-encoded to UTF-8' do
      expect(subject).to receive(:force_encoding).with('UTF-8')
      expect { subject.to_json }.to raise_error(Encoding::UndefinedConversionError) # Because the mock expectation IS the test.
    end

    it 'gets scrubbed it if is not valid' do
      expect(subject).to receive(:scrub!)
      expect { subject.to_json }.to raise_error(JSON::GeneratorError) # Because the mock expectation IS the test.
    end

    it 'gets scrubbed to the replacement character' do
      expect(subject.to_json).to eq("\"�\"")
    end

    context 'single quoting trap' do
      subject { '\xE2'.force_encoding('ASCII-8BIT') }

      it 'gets scrubbed to a multi-escaped sequence' do
        expect(subject.to_json).to eq("\"\\\\xE2\"")
      end
    end
  end
end
