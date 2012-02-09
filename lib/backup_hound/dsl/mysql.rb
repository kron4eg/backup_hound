# -*- encoding: utf-8 -*-

require 'backup_hound/dsl/abstract_db'

module BackupHound::DSL
  class Mysql
    include BackupHound::DSL::AbstractDB

    def initialize
      @params = {user: 'root', password: '', host: 'localhost', port: '3306', socket: '', dbs: []}
    end
  end
end
