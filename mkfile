RUBY = /usr/bin/ruby1.9.1 -w
<|./ensorcel
RB = ${URB:%.ℛℬ=%.rb}
SPEC = ${URB_SPEC:spec/%.ℛℬ=test/%}
TEST = ${URB_TEST:test/%.ℛℬ=test/%}

%.rb: %.ℛℬ
	sed -f toascii.sed $stem.ℛℬ > $stem.rb
	chmod +x $stem.rb

first:V: rb cmd test spec

cmd:V:
	./testcmd ttt

rb:V: $RB

spec:V: 
	spec spec

test:V: $TEST

%:V: %.rb
	$RUBY -I . $stem.rb
