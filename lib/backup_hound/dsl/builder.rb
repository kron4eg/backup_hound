# -*- encoding: utf-8 -*-

require 'backup_hound/dsl/server'

module BackupHound::DSL
  class Builder
    attr_accessor :path, :servers

    def initialize(path)
      @path = path
      @servers = {}
    end

    def load
      instance_eval(open(@path).read, @path, 1)
    end

    def backup(name, &block)
      servers[name] = BackupHound::DSL::Server.new
      servers[name].instance_eval(&block)
    end
  end
end
