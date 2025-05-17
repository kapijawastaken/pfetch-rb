# vars
this = "./rubyfetch.rb"
logos = File.expand_path(File.read(File.expand_path("~/.config/rubyfetch/config")).gsub(/^#.+/, "").gsub("dir ", "").strip)+"/"
user = `whoami`.strip+"@"+`hostname`.strip+"\n--------------------"
kernel = `uname -r`
shell = ENV["SHELL"].gsub(/^.+\//, "")
# uptime
#uptime = `uptime`.strip.gsub(/.*up/, "").strip.gsub(":", " hours ").gsub(/\d\suser.*/, "").gsub(/,(?!.*,)/, " mins").gsub(/^0\shours/, "")
# distro
if `uname -a`.include?("Android")
  distro = "Android"
  uptime = `uptime`.strip.gsub(/^.*up/, "").strip.gsub(/\s\s.*/, "").gsub(/,/, "")gsub(":", " hours ").gsub(",", " mins")
elsif `uname`.strip == "Haiku"
  distro = "Haiku"
elsif `uname`.strip == "Darwin"
  this.gsub("\"sw_vers -productName\"", "`sw_vers -productName`")
  this.gsub("\"sw_vers -productVersion\"", "`sw_vers -productVersion`")
  distro = "sw_vers -productName".strip+" "+"sw_vers -productVersion".strip
else
  distro = File.read("/etc/os-release").gsub(/^(?!.*PRETTY_NAME=).*/, "").strip.gsub("PRETTY_NAME=", "").gsub("\"", "")
  uptime = `uptime`.strip.gsub(/.*up/, "").strip.gsub(":", " hours ").gsub(/\d\suser.*/, "").gsub(/,(?!.*,)/, " mins").gsub(/^0\shours/, "").strip

end
# memory (it works so dont complain)
mem = `free`.gsub(/^(Swap:).+/, "").gsub(/^\s.+/, "").strip.gsub("Mem:", "").strip.gsub(/^(\s*\d+\s+\d+).*/, '\1')
total = mem.gsub(/(?<=\s)\d+/, "").strip.to_f / (1024**2)
used = mem.gsub(/^\d+/, "").strip.to_f / (1024**2)
total2 = total.to_s.strip.gsub(/(?<=^\d\.\d{2}).*/, "").to_f.round(1).to_s
used2 = used.to_s.strip.gsub(/(?<=^\d\.\d{2}).*/, "").to_f.round(1).to_s
memory = used2+" GB / "+total2+" GB"
# reset formatting when exiting
at_exit do
  puts "\e[0m"
end

# the big if statement
if distro.include?("Rhino")
  puts "\e[1m\e[35m"+user
  puts "\e[1m\e[35mdistro\e[0m "+distro
  puts "\e[1m\e[35mkernel\e[0m "+kernel
  puts "\e[1m\e[35mshell\e[0m "+shell
  puts "\e[1m\e[35muptime\e[0m "+uptime
  puts "\e[1m\e[35mmemory\e[0m "+memory
  ascii = File.read("#{logos}rhino")
  puts ascii

elsif distro.include?("Arch")
  puts "\e[1m\e[36m"+user
  puts "\e[1m\e[36mdistro\e[0m "+distro
  puts "\e[1m\e[36mkernel\e[0m "+kernel
  puts "\e[1m\e[36mshell\e[0m "+shell
  puts "\e[1m\e[36muptime\e[0m "+uptime
  puts "\e[1m\e[36mmemory\e[0m "+memory
  ascii = File.read("#{logos}arch")
  puts ascii

elsif distro.include?("Manjaro")
  puts "\e[1m\e[32m"+user
  puts "\e[1m\e[32mdistro\e[0m "+distro
  puts "\e[1m\e[32mkernel\e[0m "+kernel
  puts "\e[1m\e[32mshell\e[0m "+shell
  puts "\e[1m\e[32muptime\e[0m "+uptime
  puts "\e[1m\e[32mmemory\e[0m "+memory 
  ascii = File.read("#{logos}manjaro")
  puts ascii

elsif distro.include?("Alpine")
  puts "\e[1m\e[34m"+user
  puts "\e[1m\e[34mdistro\e[0m "+distro
  puts "\e[1m\e[34mkernel\e[0m "+kernel
  puts "\e[1m\e[34mshell\e[0m "+shell
  puts "\e[1m\e[34muptime\e[0m "+uptime
  puts "\e[1m\e[34mmemory\e[0m "+memory
  ascii = File.read("#{logos}alpine")
  puts ascii

elsif distro.include?("Debian")
  puts "\e[1m\e[31m"+user
  puts "\e[1m\e[31mdistro\e[0m "+distro
  puts "\e[1m\e[31mkernel\e[0m "+kernel
  puts "\e[1m\e[31mshell\e[0m "+shell
  puts "\e[1m\e[31muptime\e[0m "+uptime
  puts "\e[1m\e[31mmemory\e[0m "+memory
  ascii = File.read("#{logos}debian")
  puts ascii

elsif distro.include?("Mint")
  puts "\e[1m\e[32m"+user
  puts "\e[1m\e[32mdistro\e[0m "+distro
  puts "\e[1m\e[32mkernel\e[0m "+kernel
  puts "\e[1m\e[32mshell\e[0m "+shell
  puts "\e[1m\e[32muptime\e[0m "+uptime
  puts "\e[1m\e[32mmemory\e[0m "+memory
  ascii = File.read("#{logos}mint")
  puts ascii

elsif distro.include?("Gentoo")
  puts "\e[1m\e[35m"+user
  puts "\e[1m\e[35mdistro\e[0m "+distro
  puts "\e[1m\e[35mkernel\e[0m "+kernel
  puts "\e[1m\e[35mshell\e[0m "+shell
  puts "\e[1m\e[35muptime\e[0m "+uptime
  puts "\e[1m\e[35mmemory\e[0m "+memory
  ascii = File.read("#{logos}gentoo")
  puts ascii

elsif distro.include?("Slackware")
  puts "\e[1m\e[34m"+user
  puts "\e[1m\e[34mdistro\e[0m "+distro
  puts "\e[1m\e[34mkernel\e[0m "+kernel
  puts "\e[1m\e[34mshell\e[0m "+shell
  puts "\e[1m\e[34muptime\e[0m "+uptime
  puts "\e[1m\e[34mmemory\e[0m "+memory
  ascii = File.read("#{logos}slackware")
  puts ascii

elsif distro.include?("NixOS")
  puts "\e[1m\e[36m"+user
  puts "\e[1m\e[36mdistro\e[0m "+distro
  puts "\e[1m\e[36mkernel\e[0m "+kernel
  puts "\e[1m\e[36mshell\e[0m "+shell
  puts "\e[1m\e[36muptime\e[0m "+uptime
  puts "\e[1m\e[36mmemory\e[0m "+memory
  ascii = File.read("#{logos}nixos")
  puts ascii

elsif distro.include?("Tumbleweed")
  puts "\e[1m\e[32m"+user
  puts "\e[1m\e[32mdistro\e[0m "+distro
  puts "\e[1m\e[32mkernel\e[0m "+kernel
  puts "\e[1m\e[32mshell\e[0m "+shell
  puts "\e[1m\e[32muptime\e[0m "+uptime
  puts "\e[1m\e[32mmemory\e[0m "+memory
  ascii = File.read("#{logos}tumbleweed")
  puts ascii

elsif distro.include?("EndeavourOS")
  puts "\e[1m\e[35m"+user
  puts "\e[1m\e[35mdistro\e[0m "+distro
  puts "\e[1m\e[35mkernel\e[0m "+kernel
  puts "\e[1m\e[35mshell\e[0m "+shell
  puts "\e[1m\e[35muptime\e[0m "+uptime
  puts "\e[1m\e[35mmemory\e[0m "+memory
  ascii = File.read("#{logos}endeavouros")
  puts ascii

elsif distro.include?("Fedora")
  puts "\e[1m\e[34m"+user
  puts "\e[1m\e[34mdistro\e[0m "+distro
  puts "\e[1m\e[34mkernel\e[0m "+kernel
  puts "\e[1m\e[34mshell\e[0m "+shell
  puts "\e[1m\e[34muptime\e[0m "+uptime
  puts "\e[1m\e[34mmemory\e[0m "+memory
  ascii = File.read("#{logos}fedora")
  puts ascii

elsif distro.include?("FreeBSD")
  puts "\e[1m\e[31m"+user
  puts "\e[1m\e[31mdistro\e[0m "+distro
  puts "\e[1m\e[31mkernel\e[0m "+kernel
  puts "\e[1m\e[31mshell\e[0m "+shell
  puts "\e[1m\e[31muptime\e[0m "+uptime
  puts "\e[1m\e[31mmemory\e[0m "+memory
  ascii = File.read("#{logos}freebsd")
  puts ascii

elsif distro.include?("Android")
  puts "\e[1m\e[32m"+user
  puts "\e[1m\e[32mdistro\e[0m "+distro
  puts "\e[1m\e[32mkernel\e[0m "+kernel
  puts "\e[1m\e[32mshell\e[0m "+shell
  puts "\e[1m\e[32muptime\e[0m "+uptime
  puts "\e[1m\e[32mmemory\e[0m "+memory 
  ascii = File.read("#{logos}android")
  puts ascii

elsif distro.include?("Haiku")
  puts "\e[1m\e[33m"+user
  puts "\e[1m\e[33mdistro\e[0m "+distro
  puts "\e[1m\e[33mkernel\e[0m "+kernel
  puts "\e[1m\e[31mshell\e[0m "+shell
  puts "\e[1m\e[31muptime\e[0m "+uptime
  puts "\e[1m\e[31mmemory\e[0m "+memory
  ascii = File.read("#{logos}haiku")
  puts ascii

elsif distro.include?("NetBSD")
  puts "\e[1m\e[31m"+user
  puts "\e[1m\e[31mdistro\e[0m "+distro
  puts "\e[1m\e[31mkernel\e[0m "+kernel
  puts "\e[1m\e[31mshell\e[0m "+shell
  puts "\e[1m\e[31muptime\e[0m "+uptime
  puts "\e[1m\e[31mmemory\e[0m "+memory
  ascii = File.read("#{logos}netbsd")
  puts ascii

elsif distro.include?("ac OS")
  puts "\e[1m"+user
  puts "\e[1mdistro\e[0m "+distro
  puts "\e[1mkernel\e[0m "+kernel
  puts "\e[1mshell\e[0m "+shell
  puts "\e[1muptime\e[0m "+uptime
  puts "\e[1mmemory\e[0m "+memory
  ascii = File.read("#{logos}macos")
  puts ascii










end
