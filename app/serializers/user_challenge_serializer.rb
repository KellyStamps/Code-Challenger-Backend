class UserChallengeSerializer < ActiveModel::Serializer
  attributes :completed, :git_link, :live_link
  belongs_to :user
  belongs_to :challenge
end
