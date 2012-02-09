# -*- encoding: utf-8 -*-

require 'spec_helper'

describe 'BackupHound::VERSION' do
  it "should be" do
    BackupHound::VERSION.should == '0.0.1'
  end
end
