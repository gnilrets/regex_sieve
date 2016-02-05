# RegexSeive

The RegexSieve functions in a manner similar a hash.  The regex sieve
is initialized with a hash where the keys are regular expressions and
the values can be any valid Ruby object.  The order of the keys
matters.  When the regex sieve is accessed using the array accessor
[], it returns the first matching record.

````ruby
sieve = RegexSieve.new({
  /(Invincible|Born & Raised) IPA/ => 'Craft IPA',
  /(Fresh Squeezed) IPA/           => 'Microbrew IPA',
  /IPA/                            => 'Other IPA'
})

sieve['Invincible IPA'] # => 'Craft IPA'
sieve['Awesome IPA']    # => 'Other IPA'
sieve['Kinda Pale Ale'] # => nil
````

By default, only the values are returned, but the key and all matching
capture groups can optionally be returned.

````ruby
result_and_match = sieve['Invincible IPA', :match]   # => {:value=>"Craft IPA", :match=>#<MatchData "Invincible IPA" 1:"Invincible">}
result_and_match[:match][1]                          # => 'Invincible'

result_and_key = sieve['Invincible IPA', :regex]     # => {:value=>"Craft IPA", :regex=>/(Invincible|Born & Raised) IPA/}

result_all = sieve['Invincible IPA', :regex, :match] # => {:value=>"Craft IPA", :regex=>/(Invincible|Born & Raised) IPA/, :match=>#<MatchData "Invincible IPA" 1:"Invincible">}
````
