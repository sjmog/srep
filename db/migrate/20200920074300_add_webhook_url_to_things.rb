class AddWebhookUrlToThings < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :webhook_url, :string, null: false
  end
end
