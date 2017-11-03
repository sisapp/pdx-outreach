bundle install
mkdir -p tmp/puma
bundle exec puma --config config/puma.rb
