class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.integer :commenter_id
      t.integer :testimonial_id

      t.timestamps null: true
    end
  end
end
