require('caesar_cipher')

describe '#caesar_cipher' do
  subject { shifter = caesar_cipher(input.to_s, shift) }

  context 'shift bill' do
    let(:input) { 'bill' }
    let(:shift) { 4 }

    it { should eql('fmpp') }
  end

  context 'unshift bill' do
    let(:input) { 'fmpp' }
    let(:shift) { -4 }

    it { should eql('bill') }
  end
end
