function onUpdate()
    if ratingName == '?' then
        setRatingName('?') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('You Suck!') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Damn it....') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Eh') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Bruh') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('Meh') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('Good') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('Nice') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('Awesome') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('Cool!!!') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('Awesome Dude!!') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Mod Folder Port made by NotAn127') --When the botplay is activated
    end
end