function something()
	{
		var x = window.localStorage.getItem('ccc'); // x = hh['ccc']

		x = x * 1 + 1; // x = x + 1 // x * 1 is because in JS first row return as a string. Here we remake it to integer again

		window.localStorage.setItem('ccc', x); // hh['ccc'] = x

		alert(x); // Execute a table in browser
	}

function add_to_cart(id)										// Функция добавления продукта в корзину (точнее создания пары в хеше localStorage)
	{
		var key = 'product_' + id;
		var x = window.localStorage.getItem(key);
		x = x * 1 + 1;
		window.localStorage.setItem(key, x);
		alert('Items in your cart: ' + cart_items2());
	}

function iterator()												// Мой вариант вывода всех пар из localStorage
	{
		var list = "List of all pairs in local storage hash:";
		for (var i = 0, len = localStorage.length; i < len; i++) {
			var key = localStorage.key(i);
			list = list + " " + key;
			list = list + " => " + localStorage.getItem(key) + ";";
		};
		alert(list);
	}

function cart_items()											// Мой вариант написания функции количества товаров
	{
		var total = 0;
		for(var i=0, len=localStorage.length; i<len; i++) {
    	var key = localStorage.key(i);
    	var value = localStorage[key] * 1;
    	total = total + value;
		};
		alert('Total items in cart: ' + total);
	}

function cart_items2()
	{
		var cnt = 0;											// Задание переменной
		for(var i = 0; i < window.localStorage.length; i++)		// Итерация (итератор начнёт с нулевого индекса; закончит на 1 меньше чем длинна массива; 
		{														// шаг - прибавление)
			var key = window.localStorage.key(i);				// Получаем ключ
			var value = window.localStorage.getItem(key);		// Получаем значение по ключу
			if (key.indexOf('product_') == 0) 					// Условие: ключ начинается с 'product_' (тут нулевая позиция)
			{
				cnt = cnt + value * 1;							// Сложение всех значений в результате итерации в одну переменную
			};
		};
		return cnt;												// Возврат переменной
	}