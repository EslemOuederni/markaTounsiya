class CompaniesController < ApplicationController
    before_action :set_company, only: %i[ show edit update ]
  def index
    @companies = Company.all
  end
  def show
  end
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to @company
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
    def set_company
      @company = Company.find(params[:id])
    end
    def company_params
      params.expect(company: [ :name, :website ])
    end
end
