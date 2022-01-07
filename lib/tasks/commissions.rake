namespace :commissions do
  desc "Processing user wallets"
  task :payment => :environment do
    users = User.all.order(created_at: :asc)
    users.each do |user|
      service = CommissionsPaymentService.call(user)
      if service.success?
        puts "[success] User received '#{service.result[:total_amount]}' in currency"
      else
        puts "[failed] User '#{user.id}' does not spilled by **#{service.errors.to_json}**"
      end
    end
  end
end
