# SOFE4640 FinalProject - E-Commerce Application 

## Group 3 members
Waleed El Alawi (100764573)<br> 
Rubbia Pasha (100702075)<br>
Matheeshan Sivalingam (100703887) <br>

## Wireframes
Feel free to use the wireframes to get an idea of what needs to be implemented. You don't need to follow the exact designs
https://www.figma.com/file/TqFyPPW8oh1HkuUgV2h3Hh/LoginScreen?node-id=2%3A2&t=j21PgO44uXEW2l1P-1
## Tasks
Note - Task list is tentative and is meant more of a general guidelines of what we should implement. Will add and update 
### General 
- [x] Setup and connect firebase to app
- [ ] Populate database with different products - Couple items are added just for testing purposes. Will add more later
### Login page
- [x] Design UI 
- [x] Implement general functionality (save user's input locally) 
- [x] Retrieve and compare user information from firebase
- [x] Error checking
### Create an account page
- [x] Design UI 
- [x] Implement general functionality 
- [x] Write user information to firebase
- [x] Error checking
### Home screen 
- [ ] Design UI - Base UI is created. Design will be improved later 
- [ ] Implement general functionality
- [ ] Design product cards - Base product cards are created. Design will be improved later
- [x] Retrieve product information from firebase
- [ ] Add cart functionality - Base cart functionality added (Cart has been created. Also can add items to cart)
### Product details page
- [ ] Design UI - Base UI is created. Design will be improved later 
- [ ] Implement general functionality
### Cart page
* Note - I started implementing the cart function following this tutorial up to 7:30 (https://youtu.be/LDzIMSXaKVo?t=430).<br>
The Cart page is where the user views all items added to the cart. The user should be able to adjust the quantity of each product. This should then lead to the Checkout page
- [ ] Design UI
- [ ] Implement general functionality
### Checkout Page
The checkout page is where the user inputs relevant data to complete the order. This includes stuff like shipping address and billing address. The user should be able to finalize the order here. 
- [ ] Design UI
- [ ] Implement general functionality
### Order Summary
A review of the order that user just placed. It should recap what the user has ordered as well as saving the user order to the database. 
- [ ] Design UI
- [ ] Implement general functionality
- [ ] Create a collection for orders (make sure to include user ID so we can get order history in the user profile)
### User profile
This is where the user can see the data about their account. This should include order history however it may be better to just make a new activity/page for it
- [ ] Design UI
- [ ] Implement general functionality
- [ ] Add logout button/functionality to alllow user to logout
