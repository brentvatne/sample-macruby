framework 'AppKit'

class AppDelegate
  def windowWillClose(notification)
    exit
  end

  def greet(sender)
    alert = NSAlert.new
    alert.messageText = "So it works, this code is mostly poached from definitive MacRuby"
    alert.runModal
  end
end

app = NSApplication.sharedApplication
app.delegate = AppDelegate.new

window = NSWindow.alloc.initWithContentRect([500, 500, 300, 100],
    styleMask:NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask,
    backing:NSBackingStoreBuffered,
    defer:false)
window.title      = "Simple running app"
window.level      =  NSModalPanelWindowLevel
window.delegate   = app.delegate

button = NSButton.alloc.initWithFrame([30, 10, 240, 80])
button.bezelStyle = 4
button.title      = 'Click here for a bit more interaction'
button.target     = app.delegate
button.action     = 'greet:'

window.contentView.addSubview(button)

window.display
window.orderFrontRegardless
app.run
