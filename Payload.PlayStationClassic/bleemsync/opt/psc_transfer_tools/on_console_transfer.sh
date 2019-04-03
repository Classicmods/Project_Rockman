#!/bin/sh
#
#  Copyright 2019 ModMyClassic (https://modmyclassic.com/license)
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
###############################################################################
# PlayStation Classic On-Console Transfer Tool Launch Script
# ModMyClassic.com / https://discordapp.com/invite/8gygsrw
###############################################################################

source "/var/volatile/bleemsync.cfg"

sdl_text(){
  text_x=640
  text_y=120
  text_size=16
  text_font="/usr/share/fonts/ttf/LiberationMono-Regular.ttf"
  text_bg="0x7E000000"
  background="$bleemsync_path/etc/bleemsync/IMG/splashscreen.png"
  "$bleemsync_path/bin/sdl_text_display" "$1" $text_x $text_y $text_size $text_font 255 255 255 $background $text_bg
}

[ ! -d "$mountpoint/games/" ] && mkdir -p "$mountpoint/games/"
[ ! -d "$mountpoint/transfer/" ] && mkdir -p "$mountpoint/transfer/"
chmod +x "$bleemsync_path/opt/psc_transfer_tools/psc_game_add"
cd "$bleemsync_path/opt/psc_transfer_tools"
sdl_text "Scanning transfer directory for games..."
"$bleemsync_path/opt/psc_transfer_tools/psc_game_add" "$mountpoint/transfer/" "$bleemsync_path/etc/bleemsync/SYS/databases/" "$mountpoint/games/" &> "$runtime_log_path/transfer.log"
if [ ! $? -eq 0 ]; then
  sdl_text "Failed to transfer games! Check transfer.log"
  wait 1
fi