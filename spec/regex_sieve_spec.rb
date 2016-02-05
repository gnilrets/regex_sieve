$LOAD_PATH << '../lib'
require 'regex_sieve'

describe RegexSieve do
    before do
      @sieve = RegexSieve.new({
        /(Invincible|Born & Raised) IPA/ => 'Craft IPA',
        /(Fresh Squeezed) IPA/           => 'Microbrew IPA',
        /IPA/                            => 'Other IPA'
      })
    end

  describe 'looking up a value' do
    it 'returns the value of the first match' do
      expect(@sieve['Invincible IPA']).to eq 'Craft IPA'
    end

    it 'is not just a hash lookup' do
      expect(@sieve['Random IPA']).to eq 'Other IPA'
    end

    it 'returns nil if no match is found' do
      expect(@sieve['Does not match']).to be nil
    end
  end

  describe 'using matching groups' do
    it 'returns the match groups when specified' do
      match = @sieve['Invincible IPA', :match][:match][1]
      expect(match).to eq 'Invincible'
    end
  end

  describe 'using regex and matching groups' do
    it 'returns the matched regex when specified' do
      regex = @sieve['Invincible IPA', :regex, :match][:regex]
      expect(regex).to eq /(Invincible|Born & Raised) IPA/
    end
  end
end
