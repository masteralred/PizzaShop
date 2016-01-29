function add_to_cart(id)										// Функция добавления продукта в корзину (точнее создания пары в хеше localStorage)
	{
		var key = 'product_' + id;
		var x = window.localStorage.getItem(key);
		x = x * 1 + 1;
		window.localStorage.setItem(key, x);
		update_orders();
		update_orders_button();
	}

function cart_orders()											// Функция составления списка заказов для сервера
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

function update_orders()										// Функция внесения списка заказов в input
	{
		var orders = cart_orders();
		$('#orders_input').val(orders);							// Здесь синтаксис jQuery
	}

function update_orders_button()									// Функция внесения количества заказанных позиций в кнопку
	{
		var text = 'Cart (' + cart_items() + ')';
		$('#orders_button').html('<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> ' + text);
	}

function cart_items()											// Функция высчитывания количества заказанных позиций
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

function cart_clear() 
	{
		window.localStorage.clear();
		update_orders();
		update_orders_button();
		$('#cart_clear').html("<div class='alr'>Ваша корзина пуста</div>");
	}