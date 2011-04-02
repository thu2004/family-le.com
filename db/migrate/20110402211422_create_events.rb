class CreateEvents < ActiveRecord::Migration

  def self.up
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.text :blurb
      t.boolean :locked
      t.integer :position

      t.timestamps
    end

    add_index :events, :id

    load(Rails.root.join('db', 'seeds', 'events.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "events"})

    Page.delete_all({:link_url => "/events"})

    drop_table :events
  end

end
