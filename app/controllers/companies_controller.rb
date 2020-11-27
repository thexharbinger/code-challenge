class CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :create, :new]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: "Saved"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to companies_path, notice: "Changes Saved"
    else
      render :edit
    end
  end

  def destroy
    if @company.destroy
      redirect_to companies_path, notice: "Successfully deleted company"
    else
      Rails.logger.error "Error while deleting company: #{@company.id}, errors: #{@company.errors.full_messages}"
      redirect_to companies_path, alert: "Something went wrong. Please try again later"
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :legal_name,
      :description,
      :zip_code,
      :phone,
      :email,
      :owner_id,
      :brand_color,
      services: []
    )
  end

  def set_company
    @company = Company.find(params[:id])
  end
  
end
