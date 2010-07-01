nb rspec port unit test
In order to start getting familiar with RSpec for unit testing you might
want to port your tic-tac-toe over to RSpec.  RSpec is installed with a
simple `gem install rspec`, and to run any RSpec “spec” you run `spec
filename` or `spec directory` to run all the specs in the directory.
In order for RSpec to know it’s a spec file, you need to end it with
_spec.rb.  The help for RSpec is found at the website http://rspec.info

mkdir spec
spec/board_spec.rb
Programming Ruby 1.9, pp. 194–199
http://www.pragprog.com/titles/achbd/the-rspec-book
http://stackoverflow.com/questions/2843255/how-to-test-that-invalid-arguments-raise-an-argumenterror-exception-using-rspec


nb rspec spec command
That kind of dovetails into the second task.  You shouldn’t have to
write a shell script to run all the specs, so when you port it over make
sure it can be run with a simple `spec spec`.  Your integration specs
don't need to be moved over, at least for now.

spec/board_spec.rb
test/test_board.rb
spec spec


nb install rubygems
Install rubygems1.9.1.
http://en.wikipedia.org/wiki/RubyGems


nb install rspec gem
Install the rspec gem.
gem1.9.1(1l)
gem1.9.1 list --local
gem1.9.1 list --remote | grep spec
gem1.9.1 install rspec
/home/jdc/.bashrc
PATH=$PATH:/home/jdc/.gem/ruby/1.9.1/bin/ export PATH
which spec


nb rspec info documentation before after each all example module include pending
http://rspec.info/documentation/


nb jekyll github web site blog
http://github.com/mojombo/jekyll
http://pages.github.com/
http://wiki.github.com/mojombo/jekyll/install
gem1.9.1 install jekyll
http://wiki.github.com/mojombo/jekyll/usage
http://wiki.github.com/mojombo/jekyll/configuration
http://wiki.github.com/mojombo/jekyll/sites
http://wiki.github.com/mojombo/jekyll/yaml-front-matter
http://wiki.github.com/mojombo/jekyll/template-data
