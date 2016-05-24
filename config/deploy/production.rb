set :domain, '195.64.154.145'
server '195.64.154.145', :app, :web, :db, primary: true

set :branch, 'master'

set :rails_env, 'production'

role :web, domain
role :app, domain
role :db,  domain, primary: true
