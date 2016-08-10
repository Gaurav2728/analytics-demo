class Entry < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps, create: :created_at

  dataset_module do
    def last_five_days
      where(Sequel.function(:date, :created_at) => (Date.today - 5.days..Date.today))
    end
  end

  def validate
    super
    validates_presence [:url, :created_at]
  end

  def before_save
    super

    self.entry_hash = generate_entry_hash
  end

  def self.top_entries
    attributes_to_select = [:url, Sequel.as(Sequel.function(:date, :created_at), :date)]
    Entry.last_five_days.select(
      *attributes_to_select
    ).group_and_count(
      *attributes_to_select
    ).order(:count).reverse
  end

  private

  def generate_entry_hash
    Digest::MD5.hexdigest(
      values.slice(:id, :url, :referrer, :created_at).to_s
    )
  end
end
