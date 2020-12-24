function addToShoppingCart(mealID, URI, quantity = 1) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	$('#orderSuccessModal').modal();
			updateIcons(quantity);
	    }
	};
	xhttp.open("GET", URI + "?op=add&mealID=" + mealID + "&quantity=" + quantity, true);
	xhttp.send();
}

function updateIcons(plusQuantity) {
	var sizeNodes = document.querySelectorAll(".cart__total__size");
	var cartSize = parseInt(sizeNodes[0].innerText);
	for (var i = 0; i < sizeNodes.length; i++){
		sizeNodes[i].innerText = cartSize + plusQuantity;
	}
	
}

function addToShoppingCartWithQuantity(mealID, URI, quantityNode) {
	var quantity = document.querySelector("#" + quantityNode).value;
	addToShoppingCart(mealID, URI, quantity);
}