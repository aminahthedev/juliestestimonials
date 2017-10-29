class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title
      t.string :content
      t.string :gif
      t.integer :author_id

      t.timestamps
    end
  end
end
