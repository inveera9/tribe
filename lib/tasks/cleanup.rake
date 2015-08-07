desc "Wipeout existing users and photos at day's end."
task 'cleanup' => :environment do
  require 'rubygems'

  begin
    puts "**************** Cleanup Start ********************" 
    User.destroy_all
    puts "Users deleted"
  rescue => e
    puts "Something went wrong #{e.message}"
  end
  puts "***********************************************************"
  puts 'Cleanup Successfully Completed'
end
