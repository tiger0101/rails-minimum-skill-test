require 'rails_helper'

describe 'Peds' do
  describe 'Client' do
    describe 'search' do
      context 'with First Named Applicant as "Google"' do
        it 'includes Google\'s records' do
          result = Peds::Client.search_by(firstNamedApplicant: "Google")
          expect(result[:body][:queryResults][:searchResponse][:response][:docs].map{|e| e[:firstNamedApplicant]}).to include " Google Inc."
        end
      end
    end
  end
end
