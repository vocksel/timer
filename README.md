# Timer

Simple Timer class for easy asynchronous time keeping.

```lua
local timer = Timer.new(2)

timer.Timeout:Connect(function()
    print("Timer elapsed after", timer.Duration, "seconds")
end)

timer:Start()
```

## Constructors

**Timer.new(duration: number)**

Creates a new Timer instance, which when started, will elapse after `duration`
seconds.

## Properties

**Timer.Duration: number (readonly)**

The duration (in seconds) that the timer runs for. This is the value passed in
when constructing.

**Timer.IsRunning: boolean (readonly)**

Simple flag to keep track of if the Timer is currently running or not.

**Timer.IsLooped: boolean**

Sets whether the Timer will automatically start itself again after elapsing.
This is the same as calling Start() each time Timeout is fired.

## Methods

**Timer:Start()**

Starts the timer.

If the timer is already running, this will reset the current duration. This
behavior is a bit weird, but allows you to do some neat tricks. For example, a
cooldown mechanic, where a weapon will only go on cooldown once the user stops
performing a chain of attacks.

**Timer:Stop()**

Stops the Timer, preventing Timeout from firing.

**Timer:Destroy()**

Destroys the current timer and all of its instances.

## Events

**Timer.Timeout**

This event gets fired when the Timer elapses after being started with Start().
No arguments are passed to it.
