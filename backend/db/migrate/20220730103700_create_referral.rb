class CreateReferral < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.integer "user_id", index: true
      t.text "email_body"
      t.string "referral_email"
      t.string "user_email"
      t.string "user_name"

      t.timestamps
    end
  end
end