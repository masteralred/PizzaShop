function something()
	{
		var x = window.localStorage.getItem('ccc'); // x = hh['ccc']

		x = x * 1 + 1; // x = x + 1 // x * 1 is because in JS first row return as a string. Here we remake it to integer again

		window.localStorage.setItem('ccc', x); // hh['ccc'] = x

		alert(x); // Execute a table in browser
	}

function add_to_cart(id)
	{
		var x = window.localStorage.getItem('product_' + id);
		x = x * 1 + 1;
		window.localStorage.setItem('product_' + id, x);
	}