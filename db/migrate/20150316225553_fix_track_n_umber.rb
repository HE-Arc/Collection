class FixTrackNUmber < ActiveRecord::Migration
  def change
    rename_column :tracks, :trackNumber, :track_number
  end
end
