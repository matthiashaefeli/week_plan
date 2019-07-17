class LikesController < ApplicationController
  def create
    like = Like.find_by(user_id: current_user.id, meal_string: params[:id])
    if like
      meal = Meal.find(like.meal_id)
      like.destroy
      meal.destroy
    else
      # url = 'https://www.themealdb.com/api/json/v2/8673533/lookup.php?i=' + params[:id]
      # recipe = Net::HTTP.get(URI.parse(url))
      recipe = "{\"meals\":[{\"idMeal\":\"52874\",\"strMeal\":\"Beef and Mustard Pie\",\"strDrinkAlternate\":null,\"strCategory\":\"Beef\",\"strArea\":\"British\",\"strInstructions\":\"Preheat the oven to 150C\\/300F\\/Gas 2.\\r\\nToss the beef and flour together in a bowl with some salt and black pepper.\\r\\nHeat a large casserole until hot, add half of the rapeseed oil and enough of the beef to just cover the bottom of the casserole.\\r\\nFry until browned on each side, then remove and set aside. Repeat with the remaining oil and beef.\\r\\nReturn the beef to the pan, add the wine and cook until the volume of liquid has reduced by half, then add the stock, onion, carrots, thyme and mustard, and season well with salt and pepper.\\r\\nCover with a lid and place in the oven for two hours.\\r\\nRemove from the oven, check the seasoning and set aside to cool. Remove the thyme.\\r\\nWhen the beef is cool and you're ready to assemble the pie, preheat the oven to 200C\\/400F\\/Gas 6.\\r\\nTransfer the beef to a pie dish, brush the rim with the beaten egg yolks and lay the pastry over the top. Brush the top of the pastry with more beaten egg.\\r\\nTrim the pastry so there is just enough excess to crimp the edges, then place in the oven and bake for 30 minutes, or until the pastry is golden-brown and cooked through.\\r\\nFor the green beans, bring a saucepan of salted water to the boil, add the beans and cook for 4-5 minutes, or until just tender.\\r\\nDrain and toss with the butter, then season with black pepper.\\r\\nTo serve, place a large spoonful of pie onto each plate with some green beans alongside.\",\"strMealThumb\":\"menu.jpg\",\"strTags\":\"Meat,Pie\",\"strYoutube\":\"https:\\/\\/www.youtube.com\\/watch?v=nMyBC9staMU\",\"strIngredient1\":\"Beef\",\"strIngredient2\":\"Plain Flour\",\"strIngredient3\":\"Rapeseed Oil\",\"strIngredient4\":\"Red Wine\",\"strIngredient5\":\"Beef Stock\",\"strIngredient6\":\"Onion\",\"strIngredient7\":\"Carrots\",\"strIngredient8\":\"Thyme\",\"strIngredient9\":\"Mustard\",\"strIngredient10\":\"Egg Yolks\",\"strIngredient11\":\"Puff Pastry\",\"strIngredient12\":\"Green Beans\",\"strIngredient13\":\"Butter\",\"strIngredient14\":\"Salt\",\"strIngredient15\":\"Pepper\",\"strIngredient16\":\"\",\"strIngredient17\":\"\",\"strIngredient18\":\"\",\"strIngredient19\":\"\",\"strIngredient20\":\"\",\"strMeasure1\":\"1kg\",\"strMeasure2\":\"2 tbs\",\"strMeasure3\":\"2 tbs\",\"strMeasure4\":\"200ml\",\"strMeasure5\":\"400ml\",\"strMeasure6\":\"1 finely sliced\",\"strMeasure7\":\"2 chopped\",\"strMeasure8\":\"3 sprigs\",\"strMeasure9\":\"2 tbs\",\"strMeasure10\":\"2 free-range\",\"strMeasure11\":\"400g\",\"strMeasure12\":\"300g\",\"strMeasure13\":\"25g\",\"strMeasure14\":\"pinch\",\"strMeasure15\":\"pinch\",\"strMeasure16\":\"\",\"strMeasure17\":\"\",\"strMeasure18\":\"\",\"strMeasure19\":\"\",\"strMeasure20\":\"\",\"strSource\":\"menu.jpg\",\"dateModified\":null}]}"
      meal = Meal.create(recipe: recipe, user_id: current_user.id)
      meal.save
      like = Like.create(meal_string: params[:id], user_id: current_user.id, meal_id: meal.id)
      like.save
    end
    respond_to do |format|
      format.json { render json: { notice: 'saved' } }
    end
  end
end
