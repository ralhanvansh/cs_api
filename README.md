#Ruby - 2.5.3
#Rails - 6.0.2

# To get all Categories
  GET - http://localhost:3000/categories/

# Create Category
  POST - http://localhost:3000/categories/
  body: {
	  "category":{
		  "name": "Nikon", 
		  "type": "point and shoot", 
		  "model": 2021
  	}
  }

# To get all products
  GET - http://localhost:3000/products/

# Create Product
  POST - http://localhost:3000/products
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
  GET - http://localhost:3000/products?category=category-name

# Specific User cart products
  GET - http://localhost:3000/users/:id/cart

# User Register
  POST - http://localhost:3000/users/register
  body: {
	  "user": {
		  "name": "test",
		  "email": "test@gmail.com",
		  "password": "123456"
 	  }
  }

  This will return - user_token, which will be used further to add products to cart.

# User Login
  POST - http://localhost:3000/users/login
  body:{
	  "user": {
		  "email": "test9@gmail.com",
		  "password": "123456"
  	}
  }

  This will return - user_token, which will be used further to add products to cart.

# Add product to user cart
  PUT - http://localhost:3000/users/:id/cart
  Authorization: user_token
  body: {
	  "product_id": id
  }  
