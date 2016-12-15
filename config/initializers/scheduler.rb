class Scheduler

  require 'rufus-scheduler'
  require_relative '../../lib/tasks/task_helpers'

  s = Rufus::Scheduler.singleton

  s.every '30s' do
    count = Auction.notEnded.shouldEnd.count
    Rails.logger.debug "Ending #{count} overdue auctions now"

    Auction.notEnded.shouldEnd.each do |auction|
      auction.end
    end
  end

end