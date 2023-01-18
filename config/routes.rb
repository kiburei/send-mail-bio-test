Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'staff/' => 'time_and_attendance_reports#users'
  get 'punchlog/' => 'time_and_attendance_reports#punchlog'
  get 'report/week' => 'time_and_attendance_reports#weekly_report'
  post 'update/staff' => 'time_and_attendance_reports#update_staff'
  get 'send/email' => 'time_and_attendance_reports#send_weekly_report'

end
