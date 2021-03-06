configure :development, :production do
  db = URI.parse('postgres://localhost/wearewiki_dev')

  ActiveRecord::Base.establish_connection(
    adapter:  db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    host:     db.host,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'unicode'
  )
end

