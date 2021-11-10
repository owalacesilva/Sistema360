# Variables production
# ======================
# Define rails enviroment
set :rails_env, "production"

# Configuration gitlab branch
set :branch, proc { `git rev-parse --abbrev-ref main`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# migration roles
# ======================
# set :migration_role, :app

set :rvm_type, :auto # Defaults to: :auto
set :rvm_ruby_version, "2.7.0" # Defaults to: 'default'
set :rvm_custom_path, "/usr/local/rvm" # only needed if not detected

# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server "example.com", user: "deploy", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}

# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :app, "191.252.222.113"
# role :db,  "confrontos-db-us-east-2.chkjc50q4el6.us-east-2.rds.amazonaws.com", :primary => true
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value

# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.

# Defaults to [:web]
set :assets_roles, [:app]
# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
set :rails_assets_groups, :assets
# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, %w[public/images public/javascripts public/stylesheets]
# Defaults to nil (no asset cleanup is performed)
# If you use Rails 4+ and you'd like to clean up old assets after each deploy,
# set this to the number of versions to keep
set :keep_assets, 2

set :sitemap_roles, :app

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
server "191.252.222.113",
       user: "ubuntu",
       use_sudo: true,
       ssh_options: {
        user: "ubuntu", # overrides user setting above
        forward_agent: true,
        auth_methods: %w[password],
       }
