Specs:

    Using Ruby on Rails for the project
      
      Project built with Rails 6.1.1

    Include at least one has_many relationship (x has_many y; e.g. User has_many 
    Recipes)
      
      Example: User has many Purchases

    Include at least one belongs_to relationship (x belongs_to y; e.g. Post 
    belongs_to User)
      
      Example: Purchase belongs to Category

    Include at least two has_many through relationships (x has_many y through z; e.g. 
    Recipe has_many Items through Ingredients)
      
      Examples: User has many Categories through Purchases
                Category has many Users through Purchases

    Include at least one many-to-many relationship (x has_many y through z, y 
    has_many x through z; e.g. Recipe has_many Items through Ingredients, Item 
    has_many Recipes through Ingredients)
      
      Example: User has many Categories through Purchases
        Category has many Users through Purchases

    The "through" part of the has_many through includes at least one user submittable 
    attribute, that is to say, some attribute other than its foreign keys that can be 
    submitted by the app's user (attribute_name e.g. ingredients.quantity)
      
      Purchases, a join table for Users/Categories, has many attributes, including: location, total, date, and note

    Include reasonable validations for simple model objects (list of model objects 
    with validations e.g. User, Recipe, Ingredient, Item)

        Users
          Most fields are required and emails must be unique; password is required except when using Oauth
        Purchases
          Purchases require a name and total, and the total must be a number greater than zero

    Include a class level ActiveRecord scope method (model object & class method name 
    and URL to see the working feature e.g. User.most_recipes URL: /users/
    most_recipes)

      Exmaple: Category.current_month_purchases returns purchases filtered by current month -- located at '/dashboard'

    Include signup (how e.g. Devise)

      Signup form (at '/signup' ) creates and saves a new user

    Include login (how e.g. Devise)

      After successful Bcrypt authentication, session[:user_id] is set to the logging-in user's primary key

    Include logout (how e.g. Devise)

      Logout route clears session hash

    Include third party signup/login (how e.g. Devise/OmniAuth)

      Users have the ability to sign in via Google using omniauth-google-oauth2 gem

    Include nested resource show or index (URL e.g. users/2/recipes)

      Purchases are nested by user. '/user/:id/purchases' maps to a nested index of all user's purchases

    Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)

      '/user/:id/purchases/new' displays a form that creates a new purchase with a user_id attribute set to the current user's id

    Include form display of validation errors (form URL e.g. /recipes/new)

      Errors form partial displays validation errors upon unsuccessful creation/editing of user or purchase


Confirm:

   ✓✓✓ The application is pretty DRY

   ✓✓✓ Limited logic in controllers

   ✓✓✓ Views use helper methods if appropriate

   ✓✓✓ Views use partials if appropriate

