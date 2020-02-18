#Ruby - 2.5.3
#Rails - 6.0.2

# To get all Categories
  GET - https://crownstack-api.herokuapp.com/categories/

# Create Category
  POST - https://crownstack-api.herokuapp.com/categories/
  body: {
	  "category":{
		  "name": "Nikon",
		  "type": "point and shoot",
		  "model": 2021
  	}
  }

# To get all products
  GET - https://crownstack-api.herokuapp.com/products/

# Create Product
  POST - https://crownstack-api.herokuapp.com/products
    body: {
  	  "product":{
  	  	"name": "Canon D450",
  	  	"description": "C3",
  	  	"make": 2019,
  	  	"price": 39999,
  	  	"category_id": 11
  	  }
    }


# Product of a Specific Category
  GET - https://crownstack-api.herokuapp.com/products?category=category-name

# Specific User cart products
  GET - https://crownstack-api.herokuapp.com/users/:id/cart

# User Register
  POST - https://crownstack-api.herokuapp.com/users/register
  body: {
  	  "user": {
  		  "name": "test",
  		  "email": "test@gmail.com",
  		  "password": "123456"
   	  }
    }

  This will return - user_token, which will be used further to add products to cart.

# User Login
  POST - https://crownstack-api.herokuapp.com/users/login
  body:{
	  "user": {
		  "email": "test9@gmail.com",
		  "password": "123456"
  	}
  }

  This will return - user_token, which will be used further to add products to cart.

# Add product to user cart
  PUT - https://crownstack-api.herokuapp.com/users/:id/cart
  Authorization: user_token
  body: {
	  "product_id": id
  }  
