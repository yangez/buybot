module Users
  class FindOrCreateFromSlack
    include Interactor

    delegate :auth_hash, to: :context
    delegate :info, :extra, to: :auth_hash

    def call
      user = User.find_or_initialize_by(user_id: info.user_id, team_id: info.team_id)
      user.assign_attributes(team_name: info.team, webhook_data: extra.web_hook_info)
      context.user = user if user.save
    end
  end
end
