module Glifador where

import System.IO


main:: FilePath -> String -> [(String,[Int])] ->  IO ()
main filePath glifo thing = do

    let output =  concat $ map (makeGlifo glifo) $ map makeGlifo' thing  

    x <- mapM putStrLn output

    mapM_ (appendFile filePath) output

    return ()


makeGlifo:: String -> [String] -> [String]
makeGlifo glifo s = map (\x -> "<textPath href=\"#" <> glifo <> x) s

makeGlifo':: (String,[Int]) -> [String]
makeGlifo' fragmento = map (\x -> (fst x) <> "\"> " <> (snd x) <> "</textPath>") s
    where s = map (\x-> (show x, fst fragmento)) $ snd fragmento


-- <textPath href="#path90"> Quick brown fox jumps over the lazy dog. </textPath>

-- writeFile :: FilePath -> String -> IO ()



glifo1Ask = putStrLn "33 segmentos, mariposa"
-- glifo2
-- glifo3
-- glifo4
-- glifo5
-- glifo6
-- glifo7
-- glifo8


---- tengo q hacer u documento con este texto:

