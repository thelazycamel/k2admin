namespace :maintenance do

  desc "Destroy old UserTournamentDetails (anon users)"
  task destroy_utds: :environment do
    utds = UserTournamentDetail.where("player_id ilike :p1 AND updated_at < :p2", {p1: "anon%", p2: 1.month.ago})
    puts "Destroying #{utds.count} utds"
    utds.destroy_all
  end

  desc "Destroy old Tournaments"
  task destroy_tournaments: :environment do
    #TODO consider removing tournaments where UTDs have not been updated for over a month
    tournaments = Tournament.where("finished = :p1 AND updated_at < :p2", {p1: true, p2: 1.month.ago})
    puts"Destroying #{tournaments.count} tournaments"
    tournaments.destroy_all
  end

  desc "Destroy old Games"
  task destroy_games: :environment do
    games = Game.joins(:tournament).where("tournaments.default_tournament = :p1 AND games.updated_at < :p2", {p1: true, p2: 1.month.ago})
    puts "Destroying #{games.count} games"
    games.destroy_all
  end

  desc "Destroy old Chats (From default tournament)"
  task destroy_chats: :environment do
    chats = Chat.joins(:tournament).where("tournaments.default_tournament = :p1 AND chats.inserted_at < :p2", {p1: true, p2: 1.month.ago})
    puts "Destroying #{chats.count} chats"
    chats.destroy_all
  end

  desc "Run all maintenance tasks"
  task all: :environment do
    Rake::Task["maintenance:destroy_utds"].invoke
    Rake::Task["maintenance:destroy_tournaments"].invoke
    Rake::Task["maintenance:destroy_games"].invoke
    Rake::Task["maintenance:destroy_chats"].invoke
  end

end
