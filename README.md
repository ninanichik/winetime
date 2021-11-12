For creating the migration:
bundle exec rake db:create_migration NAME=create_users_table

Run the migration
bundle exec rake db:migrate

db/migrate/... sets up mapping (ORM - Object Relational Mapper), relation between OOP and DB, 
creates tables in db