require 'rspec/its'
require 'rspec/collection_matchers'
require_relative '../lib/message_filter'

describe MessageFilter do
	shared_examples 'MessageFilter with argument "foo"' do
		it { is_expected.to be_detect('hello from foo') }
		it { is_expected.not_to be_detect('hello, world!') }
    its(:ng_words) { is_expected.not_to be_empty }
  end

  context 'with argument "foo"' do
    subject { MessageFilter.new('foo') }
    it_behaves_like 'MessageFilter with argument "foo"'
    it { is_expected.to have(1).ng_words }
  end

  context 'with argument "foo","bar"' do
    subject { MessageFilter.new('foo', 'bar') }
    it { is_expected.to be_detect('hello from bar') }
    it_behaves_like 'MessageFilter with argument "foo"'
    it { is_expected.to have(2).ng_words }
  end
end
