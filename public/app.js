function add_to_cart(id)										// Функция добавления продукта в корзину (точнее создания пары в хеше localStorage)
	{
		var key = 'product_' + id;
		var x = window.localStorage.getItem(key);
		x = x * 1 + 1;
		window.localStorage.setItem(key, x);
		update_orders();
	}

function cart_orders()
	{
		var orders = '';
		for (var i = 0, len = localStorage.length; i < len; i++) {
			var key = window.localStorage.key(i);
			var value = window.localStorage.getItem(key);
			if (key.indexOf('product_') == 0) 
			{
				orders = orders + key + '=' + value + ',';
			};	
		};
		return orders;
	}

function update_orders()
	{
		var orders = cart_orders();
		$('#orders_input').val(orders);							// Здесь синтаксис jQuery
	}

function cart_items()
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