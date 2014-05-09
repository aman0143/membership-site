class MembershipsController < ApplicationController
  def new
    render locals: {registration_form: registration_form}
  end

  def create
    if registration_form.save
      flash[:notice] = "Successfully registered"
      redirect_to root_url
    else
      render :new, locals: {registration_form: registration_form}
    end
  end

  private

  def registration_form
    @_form ||= MembershipRegistrationForm.new(registration_params)
  end

  def registration_params
    params.fetch(:membership_registration_form, {}).permit(
      :full_name,
      :email,
      :password
    )
  end
end