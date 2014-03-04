class NetworkDevicesController < ApplicationController
  before_action :set_network_device, only: [:show, :edit, :update, :destroy]

  # GET /network_devices
  # GET /network_devices.json
  def index
    @network_devices = NetworkDevice.all
  end

  # GET /network_devices/1
  # GET /network_devices/1.json
  def show
  end

  # GET /network_devices/new
  def new
    @network_device = NetworkDevice.new
  end

  # GET /network_devices/1/edit
  def edit
  end

  # POST /network_devices
  # POST /network_devices.json
  def create
    @network_device = NetworkDevice.new(network_device_params)

    respond_to do |format|
      if @network_device.save
        format.html { redirect_to @network_device, notice: 'Network device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @network_device }
      else
        format.html { render action: 'new' }
        format.json { render json: @network_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network_devices/1
  # PATCH/PUT /network_devices/1.json
  def update
    respond_to do |format|
      if @network_device.update(network_device_params)
        format.html { redirect_to @network_device, notice: 'Network device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @network_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_devices/1
  # DELETE /network_devices/1.json
  def destroy
    @network_device.destroy
    respond_to do |format|
      format.html { redirect_to network_devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_device
      @network_device = NetworkDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_device_params
      params.require(:network_device).permit(:name, :ip, :kind, :place, :position, :sn, :service_expired_day, :function, :remark, :user_id)
    end
end
