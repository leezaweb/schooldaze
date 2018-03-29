require 'bundler'
Bundler.require
require 'require_all'
require 'table_print'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = nil

# Teacher.first.get_salary
# Teacher.first.list_courses
#
#
# # Teacher.first.give_grade('William','English','A')
# Teacher.first.list_students
#
# Teacher.first.profitability
# Teacher.first.average_grades
# Teacher.first.most_registrations

# Student.first.report_card
