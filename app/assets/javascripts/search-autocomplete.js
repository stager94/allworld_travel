window.SearchAutocomplete = {
	onChange: function(el) {
		$el = $(el);
		var val = $el.val();

		clearTimeout(window.searchid);
		
		window.searchid = setTimeout(function(){
			SearchAutocomplete.callbacks.change(val);
		}, 400);
	},
	onFocus: function(el) {
		$el = $(el);
		$el.closest(".leftsearchblock").addClass("focused");
	},
	onBlur: function(el) {
		$el = $(el);
		$el.closest(".leftsearchblock").removeClass("focused");
	},
	callbacks: {
		change: function(val) {
			$.ajax({
				url: "/api/search",
				data: { q: val },
				success: function(data, status) {
					console.log(data, status);
				},
				dataType: "script"
			})
		}
	}
}
