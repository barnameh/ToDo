require "pry"
require "active_record"
require_relative "../user"
require_relative "../list"
require_relative "../item"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/dev.sqlite3"
)
