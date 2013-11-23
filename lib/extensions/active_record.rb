require 'active_record/fixtures'

class ActiveRecord::Migration
  def self.load_data(filename, dir = 'db/migrate/data')
    ActiveRecord::Fixtures.create_fixtures(File.join(Rails.root, dir), filename)
  end
end
