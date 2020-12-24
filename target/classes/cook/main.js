function confirmOrder(URI, orderID) {
	var xhttp = new XMLHttpRequest();
	var params = "orderID=" + orderID + "&op=confirm";
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	var element = document.querySelector("#order__table__" + orderID);
			element.parentElement.remove();
			$('#confirmSuccessModal').modal();
	    }
	};
	xhttp.open("POST", URI, true);
	xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhttp.send(params);
}