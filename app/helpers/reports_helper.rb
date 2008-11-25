module ReportsHelper
  def generate_table(table)
    # Table headers
    header = ""
    for column_name in table[0].keys
      header += content_tag("td", column_name)
    end
   
    html = ""
    html += content_tag("tr", header)
   
    # Loop through data
    for row in table
		table_row = ""
		for key in row.keys
			table_row += content_tag("td", row[key])
		end
		html += content_tag("tr", table_row)
    end
   
   
    return html
  end
end