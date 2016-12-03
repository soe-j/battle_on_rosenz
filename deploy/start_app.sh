#/bin/bash -eu

USERDATA=`curl -f http://169.254.169.254/latest/user-data`
export SECRET_KEY_BASE=`echo ${USERDATA} | jq -r '.SECRET_KEY_BASE'`
export BATTLE_ROSENZ_KEY=`echo ${USERDATA} | jq -r '.BATTLE_ROSENZ_KEY'`
export BATTLE_ROSENZ_URL=`echo ${USERDATA} | jq -r '.BATTLE_ROSENZ_URL'`
export BATTLE_ROSENZ_USER=`echo ${USERDATA} | jq -r '.BATTLE_ROSENZ_USER'`
export BATTLE_ROSENZ_PASS=`echo ${USERDATA} | jq -r '.BATTLE_ROSENZ_PASS'`

ENV=production

source ~/.bash_profile

cd /service/battle_on_rosenz/
bundle install -j4
bundle exec rake assets:precompile RAILS_ENV=${ENV}
bundle exec rake db:migrate RAILS_ENV=${ENV}
mkdir /service/battle_on_rosenz/tmp/pids
bundle exec rails s -e ${ENV} -d
