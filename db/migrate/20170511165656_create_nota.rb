class CreateNota < ActiveRecord::Migration[5.0]
  def change
    create_table :nota do |t|
      t.string :titulo
      t.text :texto
      t.datetime :date_visualizacao
      t.integer :cont_visualizacao
      t.integer :status
      t.integer :tipo

      t.timestamps
    end
  end
end
