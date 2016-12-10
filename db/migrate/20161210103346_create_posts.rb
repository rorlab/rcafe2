class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, comment: "글 제목"
      t.text :content, comment: "글 내용"

      t.timestamps
    end
  end
end
