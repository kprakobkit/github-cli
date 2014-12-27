require_relative '../util'
require_relative '../user'
require_relative '../Repo'

describe Util do
  let(:response) { {"name" => "user", "foo" => "bar" } }
  let(:endpoint) { 'users/kprakobkit' }

  before :each do
    http_response = double(body: response.to_json)
    allow(Net::HTTP).to receive(:start).and_return(http_response)
    @response = Util.get_response(endpoint)
  end

  it 'should return json' do
    expect(@response).to eq(response)
  end
end
