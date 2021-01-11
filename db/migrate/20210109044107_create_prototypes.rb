class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      ## タイトル
      t.string :title
      ## キャッチコピー
      t.text :catch_copy
      ## キャッチコピー
      t.text :concept
      ## ユーザー
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
