
execute "updating motd" do
  command "echo This files has been updated by Chef >> /etc/motd"
  not_if "grep Chef /etc/motd"
end

