class Punchlog < ApplicationRecord
  self.table_name = 'punchlog'

  def self.send_mail
    WeeklyReportMailer.weekly_report_email.deliver_now
  end
end
