module AssetsHelper
	def servers_qty
		Server.count
	end
	def softwares_qty
		Software.count
	end
	def network_devices_qty
		NetworkDevice.count
	end
end
