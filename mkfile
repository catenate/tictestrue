%.rb: %.ℛℬ
	sed -f toascii.sed $stem.ℛℬ > $stem.rb
