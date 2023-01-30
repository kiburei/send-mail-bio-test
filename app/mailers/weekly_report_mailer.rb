class WeeklyReportMailer < ApplicationMailer
  default from: 'gooddeeds17@gmail.com'

  def weekly_report_email
    mail(
      :to => 'Lulu.Allcock@leonardo.co.ke , jonty.vanzeller@leonardo.co.ke , Richard.Boyi@leonardo.co.ke , nt@alamaya.co , akiburei@gmail.com',
      :subject => "Attendance Weekly Report: #{(Date.today - 1.week).beginning_of_week..(Date.today - 1.week).end_of_week}"
    )
  end
end
