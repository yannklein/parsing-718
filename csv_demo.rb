require 'csv'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'
csv_options = { col_sep: ",", quote_char: "'", force_quotes: true, headers: :first_row }

data = []

CSV.foreach(filepath, csv_options) do |row|
  # p row
  puts "#{row["Name"]} is a #{row["Appearance"]} beer from #{row["Origin"]}."
  data << row
end

# No header: the row is an array of strings
# With header: the row is a CSV::Row (== hash)

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  data.each do |data_row|
    csv << data_row
  end
  csv << ['Asahi', 'Pale Lager', 'Japan']
  csv << ['Guinness', 'Stout', 'Ireland']
end