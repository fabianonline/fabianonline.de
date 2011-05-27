set :application, "fabianonline.de"
set :repository,  "git://github.com/fabianonline/geotweeter.git"
set :deploy_to, "/srv/fabian/www/jekyll"
set :use_sudo, false
set :deploy_via, :remote_cache

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "geeks"                          # Your HTTP server, Apache/etc
role :app, "geeks"                          # This may be the same as your `Web` server

namespace :deploy do
    [:start, :stop, :restart, :finalize_update].each do |t|
        desc "#{t} task is a no-op with jekyll"
        task t, :roles=>:app do ; end
    end

    desc "Update Jekyll"
    task :update_jekyll do
        run "cd #{current_path} ; sass css/style.scss css/style.css ; jekyll"
    end
end
