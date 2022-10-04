# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = CSV.parse(tsv, col_sep: "\t", headers: true).map(&:to_h)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    lines = @data[0].keys.reduce { |key1, key2| "#{key1}\t#{key2}" }
    @data.each do |col|
      lines += "\n"
      lines += col.values.reduce { |value1, value2| "#{value1}\t#{value2}" }
    end
    lines += "\n"
  end
end
