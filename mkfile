RUBY = /usr/bin/ruby1.9.1 -w
<|./ensorcel
RB = ${URB:%.ℛℬ=%.rb}
TEST = ${URB_TEST:test/%.ℛℬ=test/%}

%.rb: %.ℛℬ
	sed -f toascii.sed $stem.ℛℬ > $stem.rb
	chmod +x $stem.rb

first:V: test

rb:V: $RB

test:V: $TEST

%: %.rb
	$RUBY -I . $stem.rb > $stem
