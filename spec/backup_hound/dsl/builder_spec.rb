# -*- encoding: utf-8 -*-

require 'spec_helper'

describe BackupHound::DSL::Builder do
  let(:builder) { BackupHound::DSL::Builder.new(HOUNDFILE) }

  describe '#load' do
    it "should load Houndfile and eval it in self context" do
      builder.should_receive :backup
      builder.load
    end
  end

  describe '#backup' do
    it "should load defined server" do
      expect{ builder.load }.to change{ builder.servers.size }.by(1)
    end

    it "loaded server should be instance of BackupHound::DSL::Server" do
      builder.load
      builder.servers[:server1].should be_a BackupHound::DSL::Server
    end
  end
end
