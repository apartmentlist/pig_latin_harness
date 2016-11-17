# Pig Latin Harness

A programming-language-agnostic test harness for PigLatin translation.

## Usage

```bash
./harness.sh <cmd>
```

Where `<cmd>` is a command line utility that reads from the incomping pipeline and writes to standard out.

For example, if you had the input file `english.txt`

```
This is a
working Pig Latin
translator!
```

Then you would use the translator utility `translate.py` like

```bash
$ translate.py < english.txt
# => Isthay isway away
# => orkingway Igpay Atinlay
# => anslatortray!
```

### Example

```ruby
# pig_latin.rb
#!/usr/bin/env ruby

module PigLatin
  def self.translate(string)
    string.gsub(/\w+/) do |word|
      word.sub(/^(y|[^aeioquy]*(?:qu)?)(.*)/i) do
        "#{$2}#{$1}#{$1 == '' ? 'w' : ''}ay"
      end.tap { |w| w.capitalize! if word =~ /^[A-Z]/ }
    end
  end
end

puts PigLatin.translate(ARGF.read)
```

```bash
chmod 700 pig_latin.rb
./harness.sh ./pig_latin.rb
```

### Successful output

When the program successfully translates all test input, you will see the following printed out

```
Testing ./pig_latin.rb tests/1-words.in

# Pass #

Testing ./pig_latin.rb tests/2-sentences.in

# Pass #

Testing ./pig_latin.rb tests/3-literature.in

# Pass #
```

### Failure output

If any word or sentence is not translated correctly, you will see output that looks like

```
Testing ./pig_latin.rb tests/1-words.in

6c6
< yellowway
---
> ellowyay

# Fail #
```