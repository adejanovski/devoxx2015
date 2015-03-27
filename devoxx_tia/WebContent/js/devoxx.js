function reloadAll(){
	getCounts();
}

function getCounts() {	
	$.ajax({
		url: "get-count-speakers",
		type: 'GET',		
		success: function (data) {
			$("#nb_speakers").html(data);
        },
		error:function(data,status,er) {
			alert("error: "+data+" status: "+status+" er:"+er);
		}
	});
	
	$.ajax({
		url: "get-count-talks",
		type: 'GET',		
		success: function (data) {
			$("#nb_talks").html(data);
        },
		error:function(data,status,er) {
			alert("error: "+data+" status: "+status+" er:"+er);
		}
	});
	
	
	getByTypeTalk();
	drawTalksChart();
	
	
	
	
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


function drawTalksChart(){
	$("#graph-container").html('<div id="talks-chart"  class="graph"></div>');
    	var tax_data = [
                    {"Annee": "2015", "TIA":62, "Conf":88, "Lab":15, "Quickie":20},
                    {"Annee": "2014", "TIA":44, "Conf":75, "Lab":13, "Quickie":24},
                    {"Annee": "2013", "TIA":23, "Conf":60, "Lab":12, "Quickie":18},
                    {"Annee": "2012", "TIA":34, "Conf":65, "Lab":10, "Quickie":12}
               ];
    
	Morris.Line({
        element: 'talks-chart',
        data: tax_data,
        xkey: 'Annee',
        ykeys: ['TIA', 'Conf', 'Lab', 'Quickie'],
        labels: ['TIA', 'Conf', 'Lab', 'Quickie'],
        lineColors:['#4ECDC4','#ed5565']
      });
}
