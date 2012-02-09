# -*- encoding: utf-8 -*-

module BackupHound::DSL
  class Postgresql
    attr_accessor :params

    def initialize
      @params = {user: 'postgres', password: '', host: 'localhost', port: '5432', socket: '', dbs: []}
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
