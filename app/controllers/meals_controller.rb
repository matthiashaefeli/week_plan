class MealsController < ApplicationController
  def index
    # url = 'https://www.themealdb.com/api/json/v2/8673533/categories.php'
    # result = Net::HTTP.get(URI.parse(url))
    # categories = JSON.parse(result)
    # @categories = categories['categories']
    @categories =[
      {"idCategory"=>"1",
      "strCategory"=>"Beef",
      "strCategoryThumb"=>"menu.jpg",
      "strCategoryDescription"=>
       "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"},
     {"idCategory"=>"2",
      "strCategory"=>"Chicken",
      "strCategoryThumb"=>"menu.jpg",
      "strCategoryDescription"=>
       "The chicken (Gallus gallus domesticus) is a type of domesticated fowl, a subspecies of the red junglefowl. It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets."},
     {"idCategory"=>"3",
      "strCategory"=>"Dessert",
      "strCategoryThumb"=>"menu.jpg",
      "strCategoryDescription"=>
       "Dessert (/dɪˈzɜːrt/) is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. In some parts of the world, such as much of central and western Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.\r\n\r\nThe term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, pastries, pies, puddings, and sweet soups, and tarts. Fruit is also commonly found in dessert courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly savory to create desserts."},
       {"idCategory"=>"1",
       "strCategory"=>"Beef",
       "strCategoryThumb"=>"menu.jpg",
       "strCategoryDescription"=>
        "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"},
      {"idCategory"=>"2",
       "strCategory"=>"Chicken",
       "strCategoryThumb"=>"menu.jpg",
       "strCategoryDescription"=>
        "The chicken (Gallus gallus domesticus) is a type of domesticated fowl, a subspecies of the red junglefowl. It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets."},
      {"idCategory"=>"3",
       "strCategory"=>"Dessert",
       "strCategoryThumb"=>"menu.jpg",
       "strCategoryDescription"=>
        "Dessert (/dɪˈzɜːrt/) is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. In some parts of the world, such as much of central and western Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.\r\n\r\nThe term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, pastries, pies, puddings, and sweet soups, and tarts. Fruit is also commonly found in dessert courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly savory to create desserts."},
        {"idCategory"=>"1",
        "strCategory"=>"Beef",
        "strCategoryThumb"=>"menu.jpg",
        "strCategoryDescription"=>
         "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"},
       {"idCategory"=>"2",
        "strCategory"=>"Chicken",
        "strCategoryThumb"=>"menu.jpg",
        "strCategoryDescription"=>
         "The chicken (Gallus gallus domesticus) is a type of domesticated fowl, a subspecies of the red junglefowl. It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets."},
       {"idCategory"=>"3",
        "strCategory"=>"Dessert",
        "strCategoryThumb"=>"menu.jpg",
        "strCategoryDescription"=>
         "Dessert (/dɪˈzɜːrt/) is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. In some parts of the world, such as much of central and western Africa, and most parts of China, there is no tradition of a dessert course to conclude a meal.\r\n\r\nThe term dessert can apply to many confections, such as biscuits, cakes, cookies, custards, gelatins, ice creams, pastries, pies, puddings, and sweet soups, and tarts. Fruit is also commonly found in dessert courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly savory to create desserts."}]
  end

  def meals
    # url = 'https://www.themealdb.com/api/json/v2/8673533/filter.php?c=' + params[:category]
    # result = Net::HTTP.get(URI.parse(url))
    # meals = JSON.parse(result)
    # @meals = meals['meals']
    @meals =[
      {"strMeal"=>"Beef and Mustard Pie", "strMealThumb"=>"menu.jpg", "idMeal"=>"52874"},
     {"strMeal"=>"Beef and Oyster pie", "strMealThumb"=>"menu.jpg", "idMeal"=>"52878"},
     {"strMeal"=>"Beef Bourguignon", "strMealThumb"=>"menu.jpg", "idMeal"=>"52904"},
     {"strMeal"=>"Beef Brisket Pot Roast", "strMealThumb"=>"menu.jpg", "idMeal"=>"52812"},
     {"strMeal"=>"Beef Dumpling Stew", "strMealThumb"=>"menu.jpg", "idMeal"=>"52873"},
     {"strMeal"=>"Beef Lo Mein", "strMealThumb"=>"menu.jpg", "idMeal"=>"52952"},
     {"strMeal"=>"Beef stroganoff", "strMealThumb"=>"menu.jpg", "idMeal"=>"52834"},
     {"strMeal"=>"Beef Sunday Roast", "strMealThumb"=>"menu.jpg", "idMeal"=>"52824"},
     {"strMeal"=>"Beef Wellington", "strMealThumb"=>"menu.jpg", "idMeal"=>"52803"},
     {"strMeal"=>"Braised Beef Chilli", "strMealThumb"=>"menu.jpg", "idMeal"=>"52826"},
     {"strMeal"=>"Irish stew", "strMealThumb"=>"menu.jpg", "idMeal"=>"52781"},
     {"strMeal"=>"Jamaican Beef Patties", "strMealThumb"=>"menu.jpg", "idMeal"=>"52938"},
     {"strMeal"=>"Ma Po Tofu", "strMealThumb"=>"menu.jpg", "idMeal"=>"52947"},
     {"strMeal"=>"Massaman Beef curry", "strMealThumb"=>"menu.jpg", "idMeal"=>"52827"},
     {"strMeal"=>"Minced Beef Pie", "strMealThumb"=>"menu.jpg", "idMeal"=>"52876"},
     {"strMeal"=>"Montreal Smoked Meat", "strMealThumb"=>"menu.jpg", "idMeal"=>"52927"},
     {"strMeal"=>"Oxtail with broad beans", "strMealThumb"=>"menu.jpg", "idMeal"=>"52943"},
     {"strMeal"=>"Pate Chinois", "strMealThumb"=>"menu.jpg", "idMeal"=>"52930"}]
     render partial: 'meals'
  end

  def recipes
    # url = 'https://www.themealdb.com/api/json/v2/8673533/lookup.php?i=' + params[:id]
    # result = Net::HTTP.get(URI.parse(url))
    # recipe = JSON.parse(result)
    # @recipe = recipe['meals'][0]
    @recipe = [
      {"idMeal"=>"52874",
      "strMeal"=>"Beef and Mustard Pie",
      "strDrinkAlternate"=>nil,
      "strCategory"=>"Beef",
      "strArea"=>"British",
      "strInstructions"=>
      "Preheat the oven to 150C/300F/Gas 2.\r\nToss the beef and flour together in a bowl with some salt and black pepper.\r\nHeat a large casserole until hot, add half of the rapeseed oil and enough of the beef to just cover the bottom of the casserole.\r\nFry until browned on each side, then remove and set aside. Repeat with the remaining oil and beef.\r\nReturn the beef to the pan, add the wine and cook until the volume of liquid has reduced by half, then add the stock, onion, carrots, thyme and mustard, and season well with salt and pepper.\r\nCover with a lid and place in the oven for two hours.\r\nRemove from the oven, check the seasoning and set aside to cool. Remove the thyme.\r\nWhen the beef is cool and you're ready to assemble the pie, preheat the oven to 200C/400F/Gas 6.\r\nTransfer the beef to a pie dish, brush the rim with the beaten egg yolks and lay the pastry over the top. Brush the top of the pastry with more beaten egg.\r\nTrim the pastry so there is just enough excess to crimp the edges, then place in the oven and bake for 30 minutes, or until the pastry is golden-brown and cooked through.\r\nFor the green beans, bring a saucepan of salted water to the boil, add the beans and cook for 4-5 minutes, or until just tender.\r\nDrain and toss with the butter, then season with black pepper.\r\nTo serve, place a large spoonful of pie onto each plate with some green beans alongside.",
      "strMealThumb"=>"https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg",
      "strTags"=>"Meat,Pie",
      "strYoutube"=>"https://www.youtube.com/watch?v=nMyBC9staMU",
      "strIngredient1"=>"Beef",
      "strIngredient2"=>"Plain Flour",
      "strIngredient3"=>"Rapeseed Oil",
      "strIngredient4"=>"Red Wine",
      "strIngredient5"=>"Beef Stock",
      "strIngredient6"=>"Onion",
      "strIngredient7"=>"Carrots",
      "strIngredient8"=>"Thyme",
      "strIngredient9"=>"Mustard",
      "strIngredient10"=>"Egg Yolks",
      "strIngredient11"=>"Puff Pastry",
      "strIngredient12"=>"Green Beans",
      "strIngredient13"=>"Butter",
      "strIngredient14"=>"Salt",
      "strIngredient15"=>"Pepper",
      "strIngredient16"=>"",
      "strIngredient17"=>"",
      "strIngredient18"=>"",
      "strIngredient19"=>"",
      "strIngredient20"=>"",
      "strMeasure1"=>"1kg",
      "strMeasure2"=>"2 tbs",
      "strMeasure3"=>"2 tbs",
      "strMeasure4"=>"200ml",
      "strMeasure5"=>"400ml",
      "strMeasure6"=>"1 finely sliced",
      "strMeasure7"=>"2 chopped",
      "strMeasure8"=>"3 sprigs",
      "strMeasure9"=>"2 tbs",
      "strMeasure10"=>"2 free-range",
      "strMeasure11"=>"400g",
      "strMeasure12"=>"300g",
      "strMeasure13"=>"25g",
      "strMeasure14"=>"pinch",
      "strMeasure15"=>"pinch",
      "strMeasure16"=>"",
      "strMeasure17"=>"",
      "strMeasure18"=>"",
      "strMeasure19"=>"",
      "strMeasure20"=>"",
      "strSource"=>"https://www.bbc.co.uk/food/recipes/beef_and_mustard_pie_58002",
      "dateModified"=>nil}]
    render partial: 'recipe'

  end
end
