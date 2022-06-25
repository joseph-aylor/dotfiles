# Set the keyboard to Windows mode via the side switch
# Use Fn + X + L (hold for 4 seconds) to set the function key row to "Function" mode. (usually all that's necessary on Windows)
echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode
# Once complete, my F1-F12 keys work properly, and holding Fn turns them into multimedia keys. You can use the evtest utility to check how keyboard keys are registering until you get the above combination of settings configured properly.
# To persist this change, add a module option for hid_apple:
echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
# You may need to rebuild your initramfs if hid_apple is included.
# ubuntu: sudo update-initramfs -u 
# arch: mkinitcpio -P
