module Peds
  # refs: https://ped.uspto.gov/peds/
  PEDS_QUERIES_URL = "https://ped.uspto.gov/api/queries"
  class Client
    def self.search_by query
      params = {
        "qf":"#{query.keys.first}",
        "searchText":"#{query.values.first}",
        "fl": "applId, appFilingDate, patentNumber, patentTitle, appStatus, #{query.keys.first}",
        "facet": "false",
        "sort": "applId asc",
        "start": "0"
      }
      search_with_queries(params)
    end

    private
    def self.search_with_queries params
      response = RestClient.post(PEDS_QUERIES_URL,
        params.to_json,
        {content_type: 'application/json'}
      )
      {
        status: response.code,
        body: JSON.parse(response.body, {:symbolize_names => true})
      }
    rescue RestClient::Exception => e
      {
        status: e.response.code,
        body: e.response.body
      }
    end
  end
end
