namespace :queues do
  desc "Processing user spill queue"
  task :spill => :environment do
    queue = UserSpillQueue.not_spilled_by_old
    queue.each do |user_to_spill|
      service = UserSpillService.call(user_to_spill)
      if service.success?
        puts "[success] User '#{service.result.user_id}' alright spilled"
      else
        puts "[failed] User '#{user_to_spill.user_id}' does not spilled by **#{service.errors.to_json}**"
      end
    end
  end

  desc "Processing point distribution queue"
  task :points => :environment do
    queue = PointDistribution.not_done_by_old
    queue.each do |points|
      service = PointsDistributionService.call(points)
      if service.success?
        puts "[success] User received #{service.result} points"
      else
        puts "[failed] User '#{points.user_id}' does not received points by **#{service.errors.to_json}**"
      end
    end
  end
end
