namespace :cleanup do
  desc "Clean up running, stale containers"
  task :repls do
    output = `docker ps --filter ancestor="moonglum/halunke" --format "{{.ID}}| {{.CreatedAt}}"`
    lines = output.split("\n")
    containers = lines.map do |line|
      items = line.split("|")
      {id: items[0], date: DateTime.parse(items[1])}
    end
    ids = containers.keep_if{|c| c[:date] < (Time.now - 60.minutes) }.map { |c| c[:id]}.join(" ")
    system "docker stop #{ids}" unless ids.empty?
  end
end
