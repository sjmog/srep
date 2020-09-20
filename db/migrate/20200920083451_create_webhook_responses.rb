class CreateWebhookResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :webhook_responses do |t|
      t.json :data
      t.references :thing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
