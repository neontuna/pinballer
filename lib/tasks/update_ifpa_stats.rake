desc "update IFPA stats for all players in DB"
task :update_ifpa_stats => :environment do
  puts "Updating stats..."
  Player.all.each do |p|
    sleep(2) # be nice to ifpa API
    puts p.ifpa_id
    p.save_ifpa_stats
  end
  puts "done."
end