class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.string :gif, null: false
      t.integer :author_id

      t.timestamps null: true
    end
  end
end
