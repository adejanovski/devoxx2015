function reloadAll(){
	getTableCounts();	
}

function reloadAllSociete(){
	//getCounts();	
	
	getTopSociete();
}

function reloadAllSpeakers(){
	//getCounts();	
	drawNbSpeakerChart();
	getTopSpeaker();
}

function reloadAllBuzzwords(){
	//getCounts();	
	drawBuzzwordChart();
	getTopBuzzwords();
}


function getTableCounts() {	
	$.ajax({
		url: "get-count-by-table",
		type: 'GET',		
		success: function (data) {
			parsedData = eval(data);
			$.each(data,function(key,value){
				$("#"+key).html(value);
				if(value>0){					
					if($("."+key).hasClass("darkblue-panel")){
						$("."+key).removeClass("darkblue-panel").addClass("twitter-panel");
					}
				}else{
					if($("."+key).hasClass("twitter-panel")){
						$("."+key).addClass("darkblue-panel").removeClass("twitter-panel");
					}
				}
			});
			
        }
	});
	
		
}


function getCounts() {	
	$.ajax({
		url: "get-count-speakers",
		type: 'GET',		
		success: function (data) {
			$("#nb_speakers").html(data);
        }
	});
	
	$.ajax({
		url: "get-count-talks",
		type: 'GET',		
		success: function (data) {
			$("#nb_talks").html(data);
        }
	});
	
	
	
}


$(document).ready(function(){
	$("#start").click(function(){
		
		$("tr:has(td)").remove();
		
		for(i = 1 ; i < 5 ; i++){
			$("#asyncResponse").append($('<tr/>')
					.append($('<td/>').text("request -"+i))
					.append($("<td id='ares-"+i+"' />").text("processing.."))
			);	
			sendAsync(i);
		}
	});
	
	
	$("#exit").click(function(){
		sendAsync("exit");
	});
})


function getByTypeTalk(){
	$.ajax({
		url: "get-count-by-type",
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);
			$(".type-talk-count").remove();
			parsedData = eval(data);
			var htmlToWrite ="";
			for(key in parsedData){
				htmlToWrite += '<div class="col-md-12 col-sm-12 mb type-talk-count">';
				htmlToWrite += '<div class="darkblue-panel pn" style="height:100px">';                      			
				htmlToWrite += '<div class="row">';
				htmlToWrite += '		<div>';
				htmlToWrite += '<h1 style="line-height:0.8em;color:#FFF" id="nb_speakers">' + parsedData[key] + '</h1>';
				htmlToWrite += '<h3 style="line-height:0.8em;color:#FFF">' + key + '</h3>';
				htmlToWrite += '</div></div></div></div><!-- /col-md-4-->';
			}
			$("#counts").append(htmlToWrite);
        }
	});
}

function getTopSociete(){
	$.ajax({
		url: "get-top-societe",
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);
			$(".type-talk-count").remove();
			parsedData = eval(data);
			var htmlToWrite ="";
			for(key in parsedData){
				htmlToWrite += '<div class="col-md-2 col-sm-2 mb type-talk-count">';
				htmlToWrite += '<div class="twitter-panel pn" style="height:100px">';                      			
				htmlToWrite += '<div class="row">';
				htmlToWrite += '		<div>';
				htmlToWrite += '<h1 style="line-height:0.8em;color:#FFF" id="nb_speakers">' + parsedData[key] + '</h1>';
				htmlToWrite += '<h3 style="line-height:0.8em;color:#FFF"><a style="line-height:0.8em;color:#FFF" href="societe.jsp?societe=' + key + '">' + key + '</a></h3>';
				htmlToWrite += '</div></div></div></div><!-- /col-md-4-->';
			}
			$("#counts").append(htmlToWrite);
        }
	});
}

function getTopSpeaker(){
	$.ajax({
		url: "get-top-speakers",
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);
			$(".type-talk-count").remove();
			parsedData = eval(data);
			var htmlToWrite ="";
			for(key in parsedData){
				htmlToWrite += '<div class="col-md-3 col-sm-3 mb type-talk-count">';
				htmlToWrite += '<div class="twitter-panel pn" style="height:100px">';                      			
				htmlToWrite += '<div class="row">';
				htmlToWrite += '		<div>';
				htmlToWrite += '<h1 style="line-height:0.8em;color:#FFF" id="nb_speakers">' + parsedData[key] + '</h1>';
				htmlToWrite += '<h3 style="line-height:0.8em;color:#FFF" id="nb_speakers"><a style="line-height:0.8em;color:#FFF" href="speakers.jsp?nom_speaker=' + encodeURIComponent(key.split("--")[0]) + '&id_speaker=' + encodeURIComponent(key.split("--")[1]) + '">' + key.split("--")[0] + '</a></h3>';

				htmlToWrite += '</div></div></div></div><!-- /col-md-4-->';
			}
			$("#counts").append(htmlToWrite);
        }
	});
}


function getTopBuzzwords(){
	$.ajax({
		url: "get-top-buzzwords",
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);
			$(".type-talk-count").remove();
			parsedData = eval(data);
			var htmlToWrite ="";
			for(key in parsedData){
				htmlToWrite += '<div class="col-md-2 col-sm-2 mb type-talk-count">';
				htmlToWrite += '<div class="twitter-panel pn" style="height:100px">';                      			
				htmlToWrite += '<div class="row">';
				htmlToWrite += '		<div>';
				htmlToWrite += '<h1 style="line-height:0.8em;color:#FFF" id="nb_talks"><a style="line-height:0.8em;color:#FFF" href="buzzwords.jsp?buzzword=' + encodeURIComponent(key) + '">' + parsedData[key] + '</a></h1>';
				htmlToWrite += '<h3 style="line-height:0.8em;color:#FFF"><a style="line-height:0.8em;color:#FFF" href="buzzwords.jsp?buzzword=' + encodeURIComponent(key) + '">' + key + '</a></h3>';
				htmlToWrite += '</div></div></div></div><!-- /col-md-4-->';
			}
			$("#counts").append(htmlToWrite);
        }
	});
}


function drawTalksChart(){	
	$.ajax({
		url: "get-type-by-annee",
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);			
			graphData = eval(data);			
			$("#graph-container").html('<div id="talks-chart"  class="graph"></div>');			
			
			var i=0;
			var xKey="";
			var yKeys = new Array();
			for(key in graphData[0]){
				if(i==0){
					xKey=key
				}else{
					yKeys.push(key);
				}
				i++
			}
			
			console.log("xKey: " + xKey);
			console.log("yKeys: " + yKeys);
			
		Morris.Line({
	        element: 'talks-chart',
	        data: graphData,
	        xkey: xKey,
	        ykeys: yKeys,
	        labels: yKeys,
	        xLabels : "year",
	        lineColors:['#4ECDC4','#ed5565','#9933CC','#0099CC','#669900','#FF8800','#CC0000']
	      });
		}
	});
}

function getSocieteChart(societe){	
	$.ajax({
		url: "get-societe-by-annee?societe=" + encodeURIComponent(societe),
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);			
			graphData = eval(data);			
			$("#graph-container").html('<div id="societe-chart"  class="graph"></div>');			
			
			var i=0;
			var xKey="";
			var yKeys = new Array();
			for(key in graphData[0]){
				if(i==0){
					xKey=key
				}else{
					yKeys.push(key);
				}
				i++
			}
			
			console.log("xKey: " + xKey);
			console.log("yKeys: " + yKeys);
			
		Morris.Line({
	        element: 'societe-chart',
	        data: graphData,
	        xkey: xKey,
	        ykeys: yKeys,
	        labels: yKeys,
	        xLabels : "year",
	        lineColors:['#4ECDC4','#ed5565','#9933CC','#0099CC','#669900','#FF8800','#CC0000']
	      });
		}
	});
}


function drawNbSpeakerChart(){	
	$.ajax({
		url: "get-count-speakers-par-annee",
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);			
			graphData = eval(data);			
			$("#graph-container").html('<div id="speaker-chart"  class="graph"></div>');			
			
			var i=0;
			var xKey="";
			var yKeys = new Array();
			for(key in graphData[0]){
				if(i==0){
					xKey=key
				}else{
					yKeys.push(key);
				}
				i++
			}
			
			console.log("xKey: " + xKey);
			console.log("yKeys: " + yKeys);
			
		Morris.Line({
	        element: 'speaker-chart',
	        data: graphData,
	        xkey: xKey,
	        ykeys: yKeys,
	        labels: yKeys,
	        xLabels : "year",
	        lineColors:['#4ECDC4','#ed5565','#9933CC','#0099CC','#669900','#FF8800','#CC0000']
	      });
		}
	});
}

function drawSpeakerChart(nom_speaker){	
	$.ajax({
		url: "get-speaker-by-annee?nom_speaker=" + nom_speaker ,
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);			
			graphData = eval(data);			
			$("#graph-container").html('<div id="speaker-chart"  class="graph"></div>');			
			
			var i=0;
			var xKey="";
			var yKeys = new Array();
			for(key in graphData[0]){
				if(i==0){
					xKey=key
				}else{
					yKeys.push(key);
				}
				i++
			}
			
			console.log("xKey: " + xKey);
			console.log("yKeys: " + yKeys);
			
		Morris.Line({
	        element: 'speaker-chart',
	        data: graphData,
	        xkey: xKey,
	        ykeys: yKeys,
	        labels: yKeys,
	        xLabels : "year",
	        lineColors:['#4ECDC4','#ed5565','#9933CC','#0099CC','#669900','#FF8800','#CC0000']
	      });
		}
	});
}

function drawBuzzwordChart(buzzword){	
	$.ajax({
		url: "get-buzzword-by-annee?buzzword=" + buzzword,
		type: 'GET',		
		success: function (data) {
			//$("#nb_talks").html(data);			
			graphData = eval(data);			
			$("#graph-container").html('<div id="buzzword-chart"  class="graph"></div>');			
			
			var i=0;
			var xKey="";
			var yKeys = new Array();
			for(key in graphData[0]){
				if(i==0){
					xKey=key
				}else{
					yKeys.push(key);
				}
				i++
			}
			
			console.log("xKey: " + xKey);
			console.log("yKeys: " + yKeys);
			
		Morris.Line({
	        element: 'buzzword-chart',
	        data: graphData,
	        xkey: xKey,
	        ykeys: yKeys,
	        labels: yKeys,
	        xLabels : "year",
	        lineColors:['#4ECDC4','#ed5565','#9933CC','#0099CC','#669900','#FF8800','#CC0000']
	      });
		}
	});
}

function getSpeakerTalks(id_speaker){
	$.getJSON("get-speaker-talks?id_speaker=" + encodeURIComponent(id_speaker),		
		function (data) {			
			//graphData = eval(data);
			var htmlData = "";
			$.each(data,function(key,val){
				htmlData+="<h2>" + key + "</h2><hr/>";
				$.each(val,function(index,entry){
					htmlData+="<h4><strong>" + entry.typeTalk + "</strong> - " + entry.titre + "</h4><br/>"; 
				});
			});
			
			$("#talks").html(htmlData);
		}
	);
}

function getSocieteTalks(societe){
	$.getJSON("get-societe-talks?societe=" + encodeURIComponent(societe),		
		function (data) {			
			//graphData = eval(data);
			var htmlData = "";
			$.each(data,function(key,val){
				htmlData+="<h2><strong>" + key + "</strong> (" + val.length + ")</h2><hr/>";
				$.each(val,function(index,entry){
					htmlData+="<h4><strong>" + entry.typeTalk + "</strong> - " + entry.titre + "</h4><br/>"; 
				});
			});
			
			$("#talks").html(htmlData);
		}
	);
}


