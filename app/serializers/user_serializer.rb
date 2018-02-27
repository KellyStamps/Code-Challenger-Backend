class UserSerializer < ActiveModel::Serializer
  attributes :id, :bio, :username, :user_challenges, :created_at
end

# username: user.username,
# cake_day: user.created_at.strftime('%A, %B %d, %Y'),
# id: user.id,
# bio: user.bio,
