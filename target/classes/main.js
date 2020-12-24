/*  ---------------------------------------------------
    Template Name: Ogani
    Description:  Ogani eCommerce  HTML Template
    Author: Colorlib
    Author URI: https://colorlib.com
    Version: 1.0
    Created: Colorlib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");
    });
	
	/*------------------
        Gallery filter
    --------------------*/
    $('.featured__controls li').on('click', function () {
        $('.featured__controls li').removeClass('active');
        $(this).addClass('active');
    });
    $('.account_btn_new').on('click',function (){
        var containerEl = document.querySelector('.profile__options__filter');
        var mixer = mixitup(containerEl, {
            load: {
                filter: '.lecturer'
            }
        });
    })
    if ($('.featured__filter').length > 0) {
        var containerEl = document.querySelector('.featured__filter');
        var mixer = mixitup(containerEl);
    }
	/*------------------
        Profile Function filter
    --------------------*/
	if ($('.lecturer_featured').length > 0) {
        var containerEl = document.querySelector('.profile__options__filter');
        var mixer = mixitup(containerEl, {
			load: {
				filter: '.lecturer'
			}
		});
    }
    else if ($('.profile__options__filter').length >0) {
        var containerEl = document.querySelector('.profile__options__filter');
        var mixer = mixitup(containerEl, {
            load: {
                filter: '.general'
            }
        });
    }
	/*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    //Humberger Menu
    $(".humberger__open").on('click', function () {
        $(".humberger__menu__wrapper").addClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").addClass("active");
        $("body").addClass("over_hid");
    });

    $(".humberger__menu__overlay").on('click', function () {
        $(".humberger__menu__wrapper").removeClass("show__humberger__menu__wrapper");
        $(".humberger__menu__overlay").removeClass("active");
        $("body").removeClass("over_hid");
    });

    /*------------------
		Navigation
	--------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*-----------------------
        Categories Slider
    ------------------------*/
    $(".categories__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 4,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            0: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 3,
            },

            992: {
                items: 4,
            }
        }
    });


    $('.hero__categories__all').on('click', function(){
        $('.hero__categories ul').slideToggle(400);
    });

    /*--------------------------
        Latest Product Slider
    ----------------------------*/
    $(".latest-product__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        navText: ["<span class='fa fa-angle-left'><span/>", "<span class='fa fa-angle-right'><span/>"],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------------
        Product Discount Slider
    -------------------------------*/
    $(".product__discount__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 3,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
    });

    /*---------------------------------
        Product Details Pic Slider
    ----------------------------------*/
    $(".product__details__pic__slider").owlCarousel({
        loop: true,
        margin: 20,
        items: 4,
        dots: true,
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true
    });

    /*-----------------------
		Price Range Slider
	------------------------ */
    var rangeSlider = $(".price-range"),
        minamount = $("#minamount"),
        maxamount = $("#maxamount"),
        minPrice = rangeSlider.data('min'),
        maxPrice = rangeSlider.data('max');
    rangeSlider.slider({
        range: true,
        min: minPrice,
        max: maxPrice,
        values: [minPrice, maxPrice],
        slide: function (event, ui) {
            minamount.val('$' + ui.values[0]);
            maxamount.val('$' + ui.values[1]);
        }
    });
    minamount.val('$' + rangeSlider.slider("values", 0));
    maxamount.val('$' + rangeSlider.slider("values", 1));

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*------------------
		Single Product
	--------------------*/
    $('.product__details__pic__slider img').on('click', function () {

        var imgurl = $(this).data('imgbigurl');
        var bigImg = $('.product__details__pic__item--large').attr('src');
        if (imgurl != bigImg) {
            $('.product__details__pic__item--large').attr({
                src: imgurl
            });
        }
    });

    /*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="dec qtybtn">-</span>');
    proQty.append('<span class="inc qtybtn">+</span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find('input').val(newVal);

		// Change total item value
		var currentNode = $button[0];
		// qtybtn -> pro-qty -> quantity -> shoping__cart__quantity -> shoping__cart__list
		var topItemNode = currentNode.parentNode.parentNode.parentNode.parentNode;
		updateItemPrice(topItemNode);
		updateCartPrice(topItemNode.parentNode)
    });
		
	/*-------------------
		Initialize price
	--------------------- */

	
	/*-------------------
		Remove cart item
	--------------------- */
	var cartList = $('.shoping__cart__list');
	cartList.on('click', '.icon_close', function() {
		var $close = $(this);
		$close.parent().parent().remove();
		var node = document.querySelector("#shopping__cart__list");
		updateCartPrice(node);
	});
	
	/*-------------------
		Open payment modal
	--------------------- */
	var checkoutOrder = $('.checkout__order');
	checkoutOrder.on('click', '.checkout__btn', function() {
		openPaymentModal();
	});
	
	/*-------------------
		Show payment status
	--------------------- */
	$(document).ready(function() {
		$('#paymentStatusModal').modal('show');
	})
	
})(jQuery);

// Update price function
function updateItemPrice(node){
	var proPrice = parseInt(node.querySelector("#item-price").innerText);
	var proQty = node.querySelector("#item-quantity").value;
	var totalPrice = proPrice * proQty;
	node.querySelector("#item-total-price").innerText = totalPrice;
}

function updateCartPrice(topNode){
	var sumPrice = 0;
	for (var i = 0; i < topNode.childElementCount; i++){
		sumPrice += parseInt(topNode.children[i].querySelector("#item-total-price").innerText);
	}
	document.getElementById("cart-total-price").innerText = sumPrice.toString();
}
	
function updateShoppingCart(URI) {
	var table = document.getElementById("shopping__cart__table");
	var rows = table.tBodies[0].rows;
	var mealCount = rows.length;
	var data = [];
	for (var i = 0; i < mealCount; i++) {
		var entry = {};
		entry.id = rows[i].querySelector("#item-id").value;
		entry.quantity = rows[i].querySelector("#item-quantity").value;
		data.push(entry);
	}
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", URI + "?op=update&data=" + encodeURIComponent(JSON.stringify(data)), true);
	xhttp.setRequestHeader("Content-Type", "application/json");
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
			$('#cartUpdateModal').modal();
	    }
	};
	xhttp.send();
}

function openPaymentModal() {
    $("#checkoutModal").modal();
	// let payment_methods = document.getElementsByName("payment-method");
	// let payment_method_value = null;
	// for (var i = 0; i < payment_methods.length; i++){
	// 	if (payment_methods[i].checked){
	// 		payment_method_value = payment_methods[i].value;
	// 		break;
	// 	}
	// }
	// switch (payment_method_value) {
	// 	case "momo":
	// 		break;
	// 	case "zalo-pay":
	// 		break;
	// 	case "credit-card":
	// 		$("#checkoutModal").modal();
	// 		break;
	// 	case null:
	// 		$("#errorMsgModal").modal()
	// 		break;
	// }
}



