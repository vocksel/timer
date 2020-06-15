local RunService = game:GetService("RunService")

local Timer = {}
Timer.__index = Timer

function Timer.new(duration: number)
	local self = {}

	self._Heartbeat = nil
	self._Bindable = Instance.new("BindableEvent")
	self.Duration = duration
	self.IsLooped = false
	self.IsRunning = false
	self.Timeout = self._Bindable.Event

	return setmetatable(self, Timer)
end

function Timer:Start()
	local startTime = tick()

	self.IsRunning = true

	if self._Heartbeat then
		self._Heartbeat:Disconnect()
	end

	self._Heartbeat = RunService.Heartbeat:Connect(function()
		if tick()-startTime >= self.Duration or not self.IsRunning then
			self._Heartbeat:Disconnect()

			if self.IsRunning then
				self.IsRunning = false
				self._Bindable:Fire()
			end

			if self.IsLooped then
				self:Start()
			end
		end
	end)
end

function Timer:Stop()
	self.IsRunning = false
end

function Timer:Destroy()
	self._Bindable:Destroy()
	self._Heartbeat:Disconnect()
end

return Timer
