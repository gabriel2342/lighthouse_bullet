class Account::ServiceProviders::HoursController < Account::ApplicationController
  account_load_and_authorize_resource :hour, through: :municipality, through_association: :service_providers_hours

  # GET /account/municipalities/:municipality_id/service_providers/hours
  # GET /account/municipalities/:municipality_id/service_providers/hours.json
  def index
    # if you only want these objects shown on their parent's show page, uncomment this:
    # redirect_to [:account, @municipality]
  end

  # GET /account/service_providers/hours/:id
  # GET /account/service_providers/hours/:id.json
  def show
  end

  # GET /account/municipalities/:municipality_id/service_providers/hours/new
  def new
  end

  # GET /account/service_providers/hours/:id/edit
  def edit
  end

  # POST /account/municipalities/:municipality_id/service_providers/hours
  # POST /account/municipalities/:municipality_id/service_providers/hours.json
  def create
    respond_to do |format|
      if @hour.save
        format.html { redirect_to [:account, @municipality, :service_providers_hours], notice: I18n.t("service_providers/hours.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @hour] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/service_providers/hours/:id
  # PATCH/PUT /account/service_providers/hours/:id.json
  def update
    respond_to do |format|
      if @hour.update(hour_params)
        format.html { redirect_to [:account, @hour], notice: I18n.t("service_providers/hours.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @hour] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/service_providers/hours/:id
  # DELETE /account/service_providers/hours/:id.json
  def destroy
    @hour.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @municipality, :service_providers_hours], notice: I18n.t("service_providers/hours.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def hour_params
    strong_params = params.require(:service_providers_hour).permit(
      :name,
      # 🚅 super scaffolding will insert new fields above this line.
      # 🚅 super scaffolding will insert new arrays above this line.
    )

    # 🚅 super scaffolding will insert processing for new fields above this line.

    strong_params
  end
end
