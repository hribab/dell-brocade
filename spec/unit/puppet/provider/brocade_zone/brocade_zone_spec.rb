#! /usr/bin/env ruby

require 'spec_helper'
require 'yaml'
require 'puppet/provider/brocade_fos'
require 'puppet/util/network_device/brocade_fos/device'
require 'puppet/util/network_device/base_fos'
require 'rspec/mocks'
require 'puppet/provider/brocade_fos'
require 'puppet/provider/brocade_responses'
require 'puppet/provider/brocade_messages'

describe Puppet::Type.type(:brocade_zone).provider(:brocade_zone) do

  context "when brocade_zone provider is created " do
    it "should have create method defined for brocade_zone" do
      described_class.instance_method(:create).should_not == nil

    end

    it "should have destroy method defined for brocade_zone" do
      described_class.instance_method(:destroy).should_not == nil
    end

    it "should have exists? method defined for brocade_zone" do
      described_class.instance_method(:exists?).should_not == nil

    end
  end

  context "#create"
  it "should throw error if response is RESPONSE_INVALID or RESPONSE_NAME_TOO_LONG" do
    dummy_transport=double('transport')
    dummy_transport.stub(:command).and_return (Puppet::Provider::Brocade_responses::RESPONSE_INVALID)
    dummy_resource = double ("resource")
    dummy_resource.stub(:[]).and_return ("")

   
    provider_object = described_class.new
    provider_object.instance_variable_set(:@resource, dummy_resource)
    provider_object.instance_variable_set(:@transport, dummy_transport)

    expect {provider_object.create}.to raise_error(Puppet::Error)
  end

  it "should warn if brocade zone name is already exist"

  it "should save configuration  if brocade zone is created successfully"

end

