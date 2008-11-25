require 'find'

class SqlWriter

 def self.write(path, string)
   File.open(path, 'w') { |file| file << string }
 end
 
end

class MigrationSql
 class << self
   def execute
     connection = ActiveRecord::Base.connection
     old_method = connection.class.instance_method(:execute)

     define_execute(connection) { |*args| SqlWriter.write(@sql_write_path, args.first) }
   
     root = RAILS_ROOT + "/db/migrate"
     output_dir = root + "/../migration_sql"
     Dir.mkdir output_dir unless File.exists? output_dir
     Find.find(root) do |path|
       unless path == root
         require path
         file = File.basename(path, ".rb")
         write_sql(connection, output_dir, file, :up)
         write_sql(connection, output_dir, file, :down)
       end
     end
   
     define_execute(connection) { |*args| old_method.bind(self).call(*args) }
   end
   
   def write_sql(connection, output_dir, file, direction)
     connection.instance_variable_set :@sql_write_path, output_dir + "/" + file  + "_#{direction}.sql"
     file.gsub(/^\d\d\d_/,'').camelize.constantize.send direction
   end
   
   def define_execute(connection, &block)
     connection.class.send :define_method, :execute, &block
   end
 end
end

namespace "db" do
 namespace "generate" do
   desc "generate sql for migrations"
   task "migration_sql" => :environment do
     MigrationSql.execute
   end
 end
end