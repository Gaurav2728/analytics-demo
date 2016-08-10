Sequel.migration do
  change do
    create_table(:entries) do
      primary_key :id, :type=>"int(11)"
      column :url, "varchar(255)", :null=>false
      column :referrer, "varchar(255)"
      column :entry_hash, "varchar(255)"
      column :created_at, "datetime", :null=>false
      
      index [:url, :created_at]
      index [:url]
    end
    
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO `schema_migrations` (`filename`) VALUES ('20160810051447_create_entries.rb')"
  end
end
