# encoding: UTF-8

require 'gooddata'

# Project ID
PROJECT_ID = 'we1vvh4il93r0927r809i3agif50d7iz'

# Connect to GoodData platform
c = GoodData.connect('user', 'password')

DOMAIN_NAME = 'gooddata-tomas-svarovsky'

GoodData.with_connection do |c|
    project = c.project(PROJECT_ID)

    domain = c.domain(DOMAIN_NAME)

    path = File.join(File.dirname(__FILE__), '..', '..', 'data', 'users_passwords.csv')
    puts "Loading #{path}"
    CSV.foreach(path) do |row|
        login = row[2]
        password = row[3]
        data = {
            :login => login,
            :firstName => 'FirstName',
            :lastName => 'LastName',
            :password => password,
            :verifyPassword => password,
            :email => login
        }

        domain.add_user(data)
    end
end