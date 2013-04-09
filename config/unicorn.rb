UNICORN_WORKERS = Integer(ENV["UNICORN_WORKERS"] || 1)
UNICORN_TIMEOUT = Integer(ENV["UNICORN_TIMEOUT"] || 15)

worker_processes UNICORN_WORKERS
timeout UNICORN_TIMEOUT
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    $stderr.puts 'Unicorn master trapping TERM and sending QUIT.'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    $stderr.puts 'Unicorn worker ignoring TERM and waiting for QUIT.'
  end
end
