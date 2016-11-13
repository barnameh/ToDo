class CreateItemsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :drugs do |t|
      t.string    :name
      t.integer   :list_id
      t.datetime  :due_date
      t.boolean   :complete
      t.datetime  :completion_date
      t.timestamps
    end
  end
end
