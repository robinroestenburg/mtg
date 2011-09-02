Delayed::Worker.destroy_failed_jobs = false
# Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 1
Delayed::Worker.max_run_time = 5.minutes
# Delayed::Worker.delay_jobs = !Rails.env.test?
# Delayed::Worker.logger = Rails.logger.new("log/#{Rails.env}_delayed_jobs.log", Rails.logger.level)
# Delayed::Worker.logger.auto_flushing = 1

