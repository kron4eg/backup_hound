# -*- encoding: utf-8 -*-

require 'spec_helper'

describe BackupHound::DSL::Server do
  describe '#mysql' do
    pending
  end

  describe '#postgresql' do
    pending
  end

  describe '#rsync' do
    let(:mock_block) do
      Proc.new do
        rsync do
          dir 'foo'
          dirs 'bar'
        end
      end
    end

    it "should reveice rsync" do
      subject.should_receive :rsync
      subject.instance_eval &mock_block
    end

    it "should save rsync params" do
      subject.instance_eval &mock_block
      subject.params[:rsync].should == ['foo', 'bar']
    end
  end
end
