require_relative '../util'
require_relative '../user'
require_relative '../repo'

describe Util do
  let(:response) { {"name" => "user", "foo" => "bar" } }
  let(:endpoint) { 'users/kprakobkit' }
  let(:repo) { double(watchers: 1) }

  it '#get_response should hit the right endpoint' do
    allow(Repo).to receive(:new).and_return(repo)
    allow(Util).to receive(:get_response).and_return(response)
    User.find('kprakobkit')
    expect(Util).to have_received(:get_response).with(endpoint)
  end

  it 'should return json' do
    http_response = double(body: response.to_json)
    allow(Net::HTTP).to receive(:start).and_return(http_response)
    @response = Util.get_response(endpoint)
    expect(@response).to eq(response)
  end
end
