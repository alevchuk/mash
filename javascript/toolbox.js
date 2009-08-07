/*
    clustalw-to-html - multiple sequence alignment visualization in HTML
    Copyright (C) 2009  Aleksandr O. Levchuk

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

function uncheck_show_pfams_checkbox() {
  document.getElementById("show_pfams").checked = false;
  document.getElementById("show_pfams").disabled = false;
}

function hide_blosums(){ document.getElementById('blosums').disabled = true; }
function show_blosums(){ document.getElementById('blosums').disabled = false; }
function hide_pfams(){ document.getElementById('pfams').disabled = true; } 
function show_pfams(){ document.getElementById('pfams').disabled = false; }

function look_at_toolbox_and_update() {
  if(document.getElementById("show_pfams").checked) {
    document.getElementById('blosums_legend').style.visibility = "hidden";
    document.getElementById('pfams_legend').style.visibility = "visible";

    hide_blosums();
    if (document.getElementById('pfams').href != "stylesheets/pfams.css") {
      document.getElementById('pfams').href = "stylesheets/pfams.css";
    }
    show_pfams();
  }
  else {
    document.getElementById('pfams_legend').style.visibility = "hidden";
    document.getElementById('blosums_legend').style.visibility = "visible";

    show_blosums();
    hide_pfams();
  }
}
