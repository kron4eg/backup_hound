# -*- encoding: utf-8 -*-

require 'spec_helper'

describe BackupHound::DSL::Server do
  describe '#mysql' do
    let(:mock_block) do
      Proc.new do
        mysql do
        end
      end
    end

    it "should reveice mysql" do
      subject.should_receive :mysql
      subject.instance_eval &mock_block
    end

    context "when parameters is incomplete" do
      it "should use default parameters" do
        subject.instance_eval &mock_block
        subject.params[:mysql].should == {
          user: 'root', password: '', host: 'localhost', port: '3306', socket: '', dbs: []
        }
      end
    end

    context "when parameters complete" do
      let(:mock_block) do
        Proc.new do
          mysql do
            user 'root1'
            password '1'
            host 'localhost1'
            port '33061'
            socket '/tmp/mysql1.sock'
            databases 'db1', 'db2'
            database 'db3'
          end
        end
      end

      it "should redefine params" do
        subject.instance_eval &mock_block
        subject.params[:mysql].should == {
          user: 'root1', password: '1', host: 'localhost1', port: '33061',
          socket: '/tmp/mysql1.sock', dbs: ['db1', 'db2', 'db3']
        }
      end
    end
  end

  describe '#postgresql' do
    let(:mock_block) do
      Proc.new do
        postgresql do
        end
      end
    end

    it "should reveice mysql" do
      subject.should_receive :postgresql
      subject.instance_eval &mock_block
    end

    context "when parameters is incomplete" do
      it "should use default parameters" do
        subject.instance_eval &mock_block
        subject.params[:postgresql].should == {
          user: 'postgres', password: '', host: 'localhost', port: '5432', socket: '', dbs: []
        }
      end
    end

    context "when parameters complete" do
      let(:mock_block) do
        Proc.new do
          postgresql do
            user 'postgres1'
            password '1'
            host 'localhost1'
            port '54321'
            socket '/tmp/postgresql1.sock'
            database 'db1'
            databases 'db2', 'db3'
          end
        end
      end

      it "should redefine params" do
        subject.instance_eval &mock_block
        subject.params[:postgresql].should == {
          user: 'postgres1', password: '1', host: 'localhost1', port: '54321',
          socket: '/tmp/postgresql1.sock', dbs: ['db1', 'db2', 'db3']
        }
      end
    end
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
