class TimeAndAttendanceReportsController < ApplicationController
  @@devices = {
    login: {
      id: 546838262,
      name: 'BioStation 2 546838262 (172.18.1.41)'
    },
    logout: {
      id: 541614750,
      name: 'Main Entrance slave P2 541614750'
    },
    other: {
      id: 545391539,
      name: 'SUITE 3 545391539 (172.18.1.85)'
    }
  }

  def users
    current_month = Date.today.month
    current_day = Date.today - 1.week
    @current_work_week = current_day.beginning_of_week..(current_day.end_of_week)
    staff_list = Uguser.where.not(staff_name: nil)
    @punchlog = []
    staff_list.each do |staff|
      @punchlog.push(
        Punchlog.where(bsevtdt: @current_work_week, user_id: staff.user_id).select(:devid, :devnm, :user_name, :user_id, :bsevtdt)
      )
    end
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def send_weekly_report
    WeeklyReportMailer.weekly_report_email.deliver_now
  end

  def punchlog
    punchlog = Punchlog.all.select(:devid, :devnm, :user_name, :user_id, :bsevtdt)
    render json: punchlog
  end

  def update_staff
    staff = Uguser.find_by_user_id(params[:user_id])
    staff.staff_name = params[:staff_name]
    if staff.save!
      render json: staff
    end
  end

  private

  def update_user_params
    params.permit(:user_id, :staff_name)
  end

end
