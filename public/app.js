function something()
	{
		var x = window.localStorage.getItem('ccc'); // x = hh['ccc']

		x = x * 1 + 1; // x = x + 1 // x * 1 is because in JS first row return as a string. Here we remake it to integer again

		window.localStorage.setItem('ccc', x); // hh['ccc'] = x

		alert(x); // Execute a table in browser
	}

function add_to_cart(id)
	{
		var key = 'product_' + id;
		var x = window.localStorage.getItem(key);
		x = x * 1 + 1;
		window.localStorage.setItem(key, x);
	}

function iterator()
	{
		var list = "List of all pairs in local storage hash:";
		for (var i = 0, len = localStorage.length; i < len; i++) {
			var key = localStorage.key(i);
			list = list + " " + key;
			list = list + " => " + localStorage.getItem(key) + ";";
		};
		alert(list);
	}

function cart_items()
	{
		var total = 0;
		for(var i=0, len=localStorage.length; i<len; i++) {
    	var key = localStorage.key(i);
    	var value = localStorage[key] * 1;
    	total = total + value;
		};
		alert('Total items in cart: ' + total)
	}