class CreateCoworkers < ActiveRecord::Migration[5.2]
  def change
    create_table :coworkers do |t|
      t.string :name
      t.boolean :arrived
      t.string :sha

      t.timestamps
    end
  end
end
