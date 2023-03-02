# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#
Rails.app_class.load_tasks

class Test
  def perform
    Rake::Task['sample:test'].execute
  end
end

Crono.perform(Test).every 5.seconds
#https://www.rubydoc.info/gems/crono/1.0.3