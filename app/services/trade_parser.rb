class TradeParser

  BASE_URL = 'http://mlb.mlb.com/mlb/transactions/'

  V1_YEARS = 2001..2009

  V2_YEARS = 2010..2016

  def open_v1_page(month, year)
    Nokogiri::HTML(RestClient.get(BASE_URL + "?c_id=mlb&year=#{year}&month=#{month}"))
  end

  def get_table_rows(month, year)
    page = open_v1_page(month, year)
    page.css('#mc > div > table').first.children
  end

  def find_trades(month, year)
    get_table_rows(month, year).collect do |row|
      row if row.text.include?("traded")
    end.compact
  end

  # methods not necessary for now, will just use month and year for populating trade fields
  # def get_date(row)
  #   row.children.children.children.first.text
  # end

  # def collect_dates(month, year)
  #   find_trades(month, year).collect do |row|
  #     get_date(row).strip
  #   end
  # end
end