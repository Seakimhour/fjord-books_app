# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :owner_validate, only: %i[edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show; end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = current_user.reports.create!(report_params)
    redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
  end

  def update
    @report.update!(report_params)
    redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
  end

  def destroy
    @report.destroy!
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def owner_validate
    redirect_back(fallback_location: root_path, alert: t('errors.messages.forbidden')) if current_user != @report.user
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
