require 'spec_helper'

describe Sterling::API::Client do

  context 'valid config' do
    before do 
      Sterling.configure do |config|
        config.api_version = '2.1'
        config.api_key = '1234'
        config.retailer_id = 'test'
        config.api_host = 'api'
      end
    end

    it 'sets the base url properly' do
      expect(Sterling::API::Client.new.base_url).to eql("api.retailigence.com/v2.1/")
    end
  end

  context 'invalid config' do
    it 'raises an error if the api version is nil' do
      Sterling.configure do |config|
        config.api_version = nil
        config.api_key = '1234'
        config.retailer_id = 'test'
        config.api_host = 'api'
      end

      expect{Sterling::API::Client.new}.to raise_error
    end

    it 'raises an error if the api version is not valid' do
      Sterling.configure do |config|
        config.api_version = '4.0'
        config.api_key = '1234'
        config.retailer_id = 'test'
        config.api_host = 'api'
      end

      expect{Sterling::API::Client.new}.to raise_error
    end

    it 'raises an error if the retailer is nil' do
      Sterling.configure do |config|
        config.api_version = '2.1'
        config.api_key = '1234'
        config.retailer_id = nil
        config.api_host = 'api'
      end

      expect{Sterling::API::Client.new}.to raise_error
    end

    it 'raises an error if the host is nil' do
      Sterling.configure do |config|
        config.api_version = '2.1'
        config.api_key = '1234'
        config.retailer_id = 'test'
        config.api_host = nil
      end

      expect{Sterling::API::Client.new}.to raise_error
    end
    it 'raises an error if the api host is invalid' do
      Sterling.configure do |config|
        config.api_version = '2.1'
        config.api_key = '1234'
        config.retailer_id = 'test'
        config.api_host = 'api_broken'
      end

      expect{Sterling::API::Client.new}.to raise_error
    end
  end
end