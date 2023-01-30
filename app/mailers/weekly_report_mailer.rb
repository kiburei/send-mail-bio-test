class WeeklyReportMailer < ApplicationMailer
  default from: 'gooddeeds17@gmail.com'

  def weekly_report_email
    mail(
      :to => 'akiburei@gmail.com',
      :subject => "Attendance Weekly Report: #{(Date.today - 1.week).beginning_of_week..(Date.today - 1.week).end_of_week}",
      :body => "<p>Hi</p>
        <p>Please click the following link to download the weekly attendance report</p>
        <ul>
          <li><a href='http://172.18.1.37:3000/weekly_report.xlsx' target='blank'>Report for: </a>#{(Date.today - 1.week).beginning_of_week..(Date.today - 1.week).end_of_week}</li>
        </ul>
          <p>
            Regards
          </p>"
    )
  end
end
