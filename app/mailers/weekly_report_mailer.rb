class WeeklyReportMailer < ApplicationMailer
  default from: 'gooddeeds17@gmail.com'

  def weekly_report_email
    mail(:to => 'akiburei@gmail.com', :subject => "Weekly Report: #{Date.today.beginning_of_week..Date.today.end_of_week}")
  end
end
