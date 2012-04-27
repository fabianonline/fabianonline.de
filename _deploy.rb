set :application, "fabianonline.de"
set :repository,  "git://github.com/fabianonline/fabianonline.de.git"
set :deploy_to, "/srv/fabian/www/jekyll"
set :use_sudo, false
set :deploy_via, :remote_cache
set :keep_releases, 3

after "deploy:update", "deploy:cleanup"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "geeks"                          # Your HTTP server, Apache/etc
role :app, "geeks"                          # This may be the same as your `Web` server

namespace :deploy do
    [:start, :stop, :restart].each do |t|
        desc "#{t} task is a no-op with jekyll"
        task t, :roles=>:app do ; end
    end

    desc "Run Jekyll"
    task :finalize_update do
        run "cd #{release_path} && sass --update css/ && time jekyll"
    end
end
