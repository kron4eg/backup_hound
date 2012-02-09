# -*- encoding: utf-8 -*-

require 'backup_hound/dsl/rsync'
require 'backup_hound/dsl/mysql'
require 'backup_hound/dsl/postgresql'

module BackupHound::DSL
  class Server
    attr_accessor :params

    def initialize
      @params = {}
    end

    def rsync(&block)
      rs = BackupHound::DSL::Rsync.new
      rs.instance_eval &block
      @params[:rsync] = rs.params.dup
    end

    def mysql(&block)
      ms = BackupHound::DSL::Mysql.new
      ms.instance_eval &block
      @params[:mysql] = ms.params.dup
    end

    def postgresql(&block)
      pg = BackupHound::DSL::Postgresql.new
      pg.instance_eval &block
      @params[:postgresql] = pg.params.dup
    end

    def method_missing(method_name, *args, &block)
      @params[method_name] = args
      if block_given?
        @params[method_name] << block
      end
    end
  end
end
