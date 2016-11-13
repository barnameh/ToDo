require "minitest/autorun"
require "minitest/pride"
require "active_record"
require "pry"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/dev.sqlite3"
)

require_relative "../db/migrations/create_users_table"
require_relative "../db/migrations/create_lists_table"
require_relative "../db/migrations/create_items_table"
require_relative "../user"
require_relative "../list"
require_relative "../item"

begin
  CreateUsersTable.migrate(:down)
rescue ActiveRecord::StatementInvalid
end

CreateUsersTable.migrate(:up)

begin
  CreateListsTable.migrate(:down)
rescue ActiveRecord::StatementInvalid
end

CreateListsTable.migrate(:up)

begin
  CreateItemsTable.migrate(:down)
rescue ActiveRecord::StatementInvalid
end

CreateItemsTable.migrate(:up)
