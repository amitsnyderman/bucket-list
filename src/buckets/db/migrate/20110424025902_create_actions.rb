class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.references :user
      t.references :bucket
      t.string :type
      t.string :name
      
      # Note: Single table inheritance for plugins
      # Check out Heritage [https://github.com/BenjaminMedia/Heritage] for multi-table inheritance
      
      # OAuth
      
      t.string :oauth_token
      t.string :oauth_token_secret
      
      # Email
      t.string :email_address
      
      # Twitter
      # Uses OAuth
      
      # Metablog
      t.string :metablog_endpoint
      t.string :metablog_identifier
      t.string :metablog_username
      t.string :metablog_password
      
      t.timestamps
    end
    
    add_index :actions, :type
  end

  def self.down
    drop_table :actions
  end
end
