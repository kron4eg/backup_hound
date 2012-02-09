# -*- encoding: utf-8 -*-

module BackupHound::DSL
  class Rsync
    attr_accessor :params

    def initialize
      @params = []
    end

    def dir(*args)
      @params += args
    end
    alias :dirs :dir
  end
end
