RUBY = /usr/bin/ruby1.9.1 -w
URB = $(shell find . -name '*.ℛℬ')
URB_TEST = $(shell find test -name '*.ℛℬ')
RB = ${URB:%.ℛℬ=%.rb}
TEST = ${URB_TEST:test/%.ℛℬ=test/%}

%.rb: %.ℛℬ
	sed -f toascii.sed $< > $@
	chmod +x $@

first: rb test

rb: ${RB}

test: ${TEST}

%: %.rb
	${RUBY} -I . $<
