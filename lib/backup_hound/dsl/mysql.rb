# -*- encoding: utf-8 -*-

module BackupHound::DSL
  class Mysql
    attr_accessor :params

    def initialize
      @params = {user: 'root', password: '', host: 'localhost', port: '3306', socket: '', dbs: []}
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
