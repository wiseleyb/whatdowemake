class Hstores < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION hstore'

    create_table :hstores do |t|
      t.hstore :fbdata
    end
  end
end
