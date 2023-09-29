class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, default: "", index: { unique: true }
      t.string :author, null: false, default: ""
      t.string :translator, null: false, default: ""

      t.string :state, null: false, default: ""

      t.string :slug, null: false, default: "", index: { unique: true }
      t.text :in_a_nutshell, null: false, default: ""
      t.text :description, null: false, default: ""

      t.date :published_on, null: false
      t.date :first_published_on

      t.timestamps
    end
  end
end
