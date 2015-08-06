desc "Wipeout existing users and photos at day's end."
task 'cleanup' => :environment do
  require 'rubygems'

  begin
    puts "**************** Cleanup Start ********************"
     
    Memorable.destroy_all
    puts "Memorable deleted"
    Memory.destroy_all
    puts "Memories deleted"
    Pin.destroy_all
    puts "Pins deleted"
    Tribe.destroy_all
    puts "Tribes deleted"
    User.destroy_all
    puts "Users deleted"
  rescue => e
    puts "Something went wrong #{e.message}"
  end
  puts "***********************************************************"
  puts 'Cleanup Completed'
end
