module OAI

  # allows for iteration across a list of records
  #
  #   for record in client.list_records :metadata_prefix => 'oai_dc':
  #     puts record.metadata
  #   end
  #
  # you'll need to handle resumption tokens
  
  class ListRecordsResponse < Response
    include OAI::XPath
    include Enumerable

    def each
      records = xpath_all(@doc, './/ListRecords/record')
      for record_element in records 
        yield OAI::Record.new(record_element)
      end
    end
  end
end
