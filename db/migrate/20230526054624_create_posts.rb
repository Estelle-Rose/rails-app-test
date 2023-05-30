# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title
      t.text :content
      t.references(:users, foreign_key: true, type: :uuid, default: nil)

      t.timestamps
    end
  end
end
