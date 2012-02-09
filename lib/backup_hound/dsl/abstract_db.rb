# -*- encoding: utf-8 -*-

module BackupHound::DSL
  module AbstractDB
    attr_accessor :params

    def initialize
      @params = {}
    end

    def database(*args)
      @params[:dbs] += args
    end
    alias :databases :database

    def method_missing(method_name, *args)
      if @params.include?(method_name)
        @params[method_name] = args.first
      else
        super
      end
    end
  end
end
