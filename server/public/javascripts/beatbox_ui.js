"use strict";
// Client-side interactions with the browser.

// Make connection to server when web page is fully loaded.
var socket = io.connect();

$(document).ready(function() {
	var timeout;
	var flag = true;
	var failcount = 0;
	// send the reqeust to update the status (volume, tempo, mode) every 0.5s
	window.setInterval(function() {sendCommandViaUDP("updatestatus\n")}, 500);

	$('#modeNone').click(function(){
		sendCommandViaUDP("mode1\n");
	});
	$('#modeRock1').click(function(){
		sendCommandViaUDP("mode2\n");
	});
	$('#modeRock2').click(function(){
		sendCommandViaUDP("mode3\n");
	});
	$('#volumeDown').click(function(){
		sendCommandViaUDP("volumedown\n");
	});
	$('#volumeUp').click(function(){
		sendCommandViaUDP("volumeup\n");
	});
	$('#tempoDown').click(function(){
		sendCommandViaUDP("tempodown\n");
	});
	$('#tempoUp').click(function(){
		sendCommandViaUDP("tempoup\n");
	});
	$('#hi-hat').click(function(){
		sendCommandViaUDP("hi-hat\n");
	});
	$('#snare').click(function(){
		sendCommandViaUDP("snare\n");
	});
	$('#base').click(function(){
		sendCommandViaUDP("basedrum\n");
	});
	$('#stop').click(function(){
		sendCommandViaUDP("stop\n");
	});
	// receive the message from the program and update the responding info on the website
	socket.on('commandReply', function(result) {
		flag = false;
		$('#error-box').hide();
		const commands = result.split(" ");
		switch(commands[0]) {
			case "updatemode":
				$('#modeid').text(commands[1]);
				break;
			case "updatevolume":
				$('#volumeid').val(commands[1]);
				break;
			case "updatetempo":
				$('#tempoid').val(commands[1]);
				break;
			case "updatestatus":
				$('#modeid').text(commands[1]);
				$('#volumeid').val(commands[2]);
				$('#tempoid').val(commands[3]);
				break;
		}
	});

	function sendCommandViaUDP(message) {
		socket.emit('daUdpCommand', message);
		if (!flag) {
			failcount = 0;
			clearTimeout(timeout);
			timeout = null;
		}
		timeout = setTimeout(function() {
			failcount++;
			if (failcount > 8) {
				$('#error-box').show();
			}
		},3000)
		flag = true;
	};
	let first_time = true;
	let first_time_read = 0;
	let up_time = 0;
	function readproctime() {
		// send request to server ato get the pro/uptime data
		$.get('/uptime', function(data) {
			if (first_time) {
				first_time = false;
				first_time_read = parseFloat(data);
				$('#status').text("Device up for: " + 0 + ":" + 0 + ":" + 0 + "(H:M:S)");
			} else {
				// convert time to hr, min and sec
				up_time = parseFloat(data);
				let time = up_time - first_time_read;
				let hr = Math.floor(time / 3600);
				let min = Math.floor((time % 3600) / 60);
				let sec = Math.floor(time % 60);
				$('#status').text("Device up for: " + hr + ":" + min + ":" + sec + "(H:M:S)");
			}
		});
		// console.log(`Uptime: ${hr}h ${min}m ${sec}s`);
	}
	// run the readprotime() every 1s to update the time
	window.setInterval(function() {readproctime()}, 1000);
});

