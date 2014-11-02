#!/usr/bin/expect -f

log_user 0
set timeout 20

# fritz!box IP address
set fbIp "fritz.box"
# fritz!box password
set fbPassword "PASSWORD"
# browser binary
set browser "/usr/bin/iceweasel"
# icon
set icon "~/.icons/answeringMachine.png"

spawn telnet $fbIp
expect "password:"
send "$fbPassword\n"
expect "# "

send "ls -1 /data/tam/rec/\n"
send " "
expect "# "

set numLines -2

foreach line [split $expect_out(buffer) \n] {
	set numLines "[expr $numLines + 1]"
}

if { $numLines == 0} {
	set color "black"
	set text " No messages"
} else {
	set color "red"
	set text " $numLines message(s)"
}

puts "<txt>Voice messages: \n<span weight=\"bold\" fgcolor=\"$color\">$text</span></txt><img>$icon</img><click>$browser http://$fbIp/fon_devices/tam_list.lua</click>"

send "exit\n"
expect eof
