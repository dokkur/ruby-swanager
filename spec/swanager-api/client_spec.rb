require 'spec_helper'

RSpec.describe Swanager::Client do
  describe '#user', :vcr do
    let(:client) { Swanager::Client.new }

    it 'signup' do
      expect(client.signup('test1@test.com', 'testtest')).to be_truthy
    end

    it 'signin' do
      expect(client.signin('test@test.com', 'testtest')).to be_truthy
    end
  end

  describe '#applications', :vcr do
    let(:client) { Swanager::Client.new }

    before do
      VCR.use_cassette 'sign_in' do
        client.signin('test@test.com', 'testtest')
      end
    end

    it 'loads applications' do
      expect(client.applications).to be_a Swanager::ApplicationList
    end

    it 'applications count' do
      expect(client.applications.count).to be > 0
    end
  end

  describe '#services', :vcr do
    let(:client) { Swanager::Client.new }

    before do
      VCR.use_cassette 'sign_in' do
        client.signin('test@test.com', 'testtest')
      end
    end

    it 'loads services' do
      expect(client.services).to be_a Swanager::ServiceList
    end

    it 'services count' do
      expect(client.services.count).to be > 0
    end

    it 'loads services for app' do
      expect(client.services('8f1f625a-e2f6-c63d-550c-ccebafda031413332338f2546fd7')).to be_a Swanager::ServiceList
    end

    it 'services count for app' do
      expect(client.services('8f1f625a-e2f6-c63d-550c-ccebafda031413332338f2546fd7').count).to be > 0
    end
  end
end
