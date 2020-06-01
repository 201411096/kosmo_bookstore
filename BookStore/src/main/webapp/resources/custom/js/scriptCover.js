/**
 * 
 */
	var selectFilter = $('.filter-control ul .active');
	var filters = $('.filter-control ul li');
	filters.click(function(){
		selectFilter.removeClass('active');
		selectFilter = $(this);
		selectFilter.addClass("active");
	});

$(".product-slider").owlCarousel({
    loop: true,
    margin: 25,
    nav: true,
    items: 5,
    dots: true,
    navText: ['<i class="ti-angle-left"></i>', '<i class="ti-angle-right"></i>'],
    smartSpeed: 1200,
    autoHeight: false,
    autoplay: true,
    responsive: {
        0: {
            items: 1,
        },
        576: {
            items: 2,
        },
        992: {
            items: 4,
        },
        1200: {
            items: 4,
        }
        
    }
});
