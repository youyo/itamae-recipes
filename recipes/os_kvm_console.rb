# OS kvm console

execute "set serial" do
  not_if "grep -q '^serial ' /boot/grub/grub.conf"
  command "sed -i \"/^hiddenmenu$/a serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1\nterminal --timeout=5 serial console\" /boot/grub/grub.conf"
end

execute "set console" do
  not_if "grep -q 'console=tty0' /boot/grub/grub.conf"
  command "sed -i \"s|\(kernel.*\)|\1 console=tty0 console=ttyS0,115200n|g\" /boot/grub/grub.conf"
end
