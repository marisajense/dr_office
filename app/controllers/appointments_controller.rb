class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end
  def new
    @doctors = Doctor.all.map{ |d| [d.first_name, d.last_name, d.id] }
    @patients = Patient.all.map{ |p| [p.first_name, p.last_name, p.id] }
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = 'Appointment Added'
      redirect_to doctors_path
    else
      render :new
    end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    flash[:success] = 'Appointment Removed'
    redirect_to doctor_path(appointment.doctor_id)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date, :time, :doctor_id, :patient_id)
  end

end
