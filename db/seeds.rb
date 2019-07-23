users = User.order(:created_at).take(6)
50.times do
  users.each { |user| user.shares.create!(url: 'https://www.youtube.com/watch?v=gUr4qp6YGLs') }
end