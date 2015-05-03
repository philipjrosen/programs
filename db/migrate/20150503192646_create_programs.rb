class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.string :subtitle
      t.string :code

      t.timestamps null: false
    end
  end
end
