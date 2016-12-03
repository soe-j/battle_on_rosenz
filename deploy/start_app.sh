#/bin/bash -eu

ENV=production

source ~/.bash_profile

cd /service/battle_on_rosenz/
bundle install -j4
bundle exec rake assets:precompile RAILS_ENV=${ENV}
mkdir /service/battle_on_rosenz/tmp/pids
bundle exec rails s -e ${ENV}
