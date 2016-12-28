set :domain, '144.76.117.174'
server '144.76.117.174', :app, :web, :db, primary: true

set :branch, 'master'

set :rails_env, 'production'

role :web, domain
role :app, domain
role :db,  domain, primary: true
