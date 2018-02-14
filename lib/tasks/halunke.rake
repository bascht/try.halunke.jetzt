namespace :halunke do
  desc "Pull halunke Docker image"
  task :pull_image do
    `docker pull #{ENV['HALUNKE_IMAGE']}`
  end

  desc "Clean up running, stale containers"
  task :cleanup_repls do
    output = `docker ps --filter "label=is_a_repl" --format "{{.ID}}| {{.CreatedAt}}"`
    lines = output.split("\n")
    containers = lines.map do |line|
      items = line.split("|")
      {id: items[0], date: DateTime.parse(items[1])}
    end
    ids = containers.keep_if{|c| c[:date] < (Time.now - 60.minutes) }.map { |c| c[:id]}.join(" ")
    system "docker stop #{ids}" unless ids.empty?
  end
end
