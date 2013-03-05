class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.text :svg
    end
  end
end
