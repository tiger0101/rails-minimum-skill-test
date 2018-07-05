class PedsController < ApplicationController
  def index
    result = Peds::Client.search_by(firstNamedApplicant: "Google")
    @docs = result[:body][:queryResults][:searchResponse][:response][:docs]
  end
end
