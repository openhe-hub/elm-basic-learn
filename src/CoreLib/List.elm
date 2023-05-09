-- This is not runnable, import List

-- 1. singleton num

-- > List.singleton 12
-- [12] : List number

-- 2. repeat time element
-- > List.repeat 3 (0,0)
-- [(0,0),(0,0),(0,0)]
--     : List ( number, number1 )

-- 3. range start end
-- > List.range 3 6
-- [3,4,5,6] : List Int

-- 4. :: (append front)
-- > 1 :: [2,3]
-- [1,2,3] : List number

-- 5. map 
-- > map sqrt [1,4,9] == [1,2,3]

-- 6. indexedMap
-- >  indexedMap Tuple.pair ["Tom","Sue","Bob"] == [ (0,"Tom"), (1,"Sue"), (2,"Bob") ]

-- 7. foldl
-- > foldl (::)  []  [1,2,3] == [3,2,1]
-- state
--   |> step 1
--   |> step 2
--   |> step 3

-- 8. foldr