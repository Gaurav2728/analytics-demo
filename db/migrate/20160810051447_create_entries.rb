Sequel.migration do
  change do
    create_table :entries do
      primary_key :id
      String :url, null: false
      String :referrer
      String :entry_hash
      DateTime :created_at, null: false

      index [:url]
      index [:url, :created_at]
    end
  end
end
