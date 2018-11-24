require "rake"

class TaskRunnerCommand < BaseCommand

  attr_accessor :task

  def initialize(task)
    @task = task
  end

  def execute
    prepare_tasks
    run_task
  end

  private

  def prepare_tasks
    Rake::Task.clear
    K2admin::Application.load_tasks
  end

  def run_task
    Rake::Task[@task].invoke
  end

end
