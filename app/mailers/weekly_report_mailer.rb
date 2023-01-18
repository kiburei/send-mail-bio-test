class WeeklyReportMailer < ApplicationMailer
  default from: 'akiburei@gmail.com'

  def weekly_report_email
    attachments['weekly_report.jpg'] = {:mime_type => 'application/mymimetype',
                                   :content => 'some_string' }
    mail(:to => 'gooddeeds17@gmail.com', :subject => "New account information")
  end
end
