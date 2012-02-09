# -*- encoding: utf-8 -*-

require 'backup_hound/dsl/abstract_db'

module BackupHound::DSL
  class Postgresql
    include BackupHound::DSL::AbstractDB

    def initialize
      @params = {user: 'postgres', password: '', host: 'localhost', port: '5432', socket: '', dbs: []}
    end
  end
end
