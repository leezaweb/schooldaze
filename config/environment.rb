require 'bundler'
Bundler.require
require 'require_all'
require_all './app/models'
# require './db/seeds.rb'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
